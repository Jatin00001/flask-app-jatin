from flask import Flask,render_template,request,redirect,url_for,session
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
# from flask_mail import Mail
from werkzeug.utils import secure_filename
import math
import json
import os


local_server = True
with open('config.json','r') as c:
    params = json.load(c)["params"]
    # print(params)
with open('config.json','r') as c2:
    sociallinks =json.load(c2)["sociallinks"]
    # print(sociallinks)

app = Flask(__name__)
app.secret_key = 'wH3oZ*3@P$9t#xLqS^%8Y&6j'

# uploader location
# app.config['upload_Folder'] = params['uploader_location']
# Set the upload folder configuration
app.config['UPLOAD_FOLDER'] = 'E:\\Flask\\static\\assets\\img'


# app.config.update(
#     MAIL_SERVER = 'smtp.elasticemail.com',
#     MAIL_PORT = '465',
#     MAIL_USE_SSL = True,
#     MAIL_USERNAME = params['gmail-user'],
#     MAIL_PASSWORD=  params['gmail-password']
# )
# google block its smtp server br default we use alternate methods
# mail = Mail(app)


if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']

db = SQLAlchemy(app)



class Contact(db.Model):
    '''
    sno, name phone_num, msg, date, email
    '''
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)



class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    subhead = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)

@app.route('/')
def hello():  
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)
    posts = posts[ (page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+ int (params['no_of_posts'])]
    if page==1:
        prev = "#"
        next = "/?page="+ str(page+1)
    elif page==last:
        prev = "/?page="+ str(page-1)
        next = "#"
    else:
        prev = "/?page="+ str(page-1)
        next = "/?page="+ str(page+1)

    return render_template('index.html',params =params,sociallinks=sociallinks, posts=posts, prev=prev,next=next)
    


@app.route('/about')
def about():
    return render_template('about.html',params =params,sociallinks=sociallinks)


#custom route with dynamic url for dynamically change over content fetch over post from sql and render on page with unique column this is how we fetch contemt
@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    # print(post)
    return render_template('post.html', params=params, post=post,sociallinks=sociallinks)



@app.route('/uploader', methods=['GET','POST'])
def uploader():
    if 'user' in session and session['user'] == params['user_name']:
        if request.method == 'POST':
            f = request.files['file']
            if f:
                filename1 = secure_filename(f.filename)
                f.save(os.path.join(app.config['UPLOAD_FOLDER'],filename1))
                return redirect('/dashboard')
            else:
                return "No file selected"
    else:
        return "Unauthorized"



@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contact(name=name, phone_num = phone, msg = message, date= datetime.now(),email = email )
        db.session.add(entry)
        db.session.commit()
        # mail.send_message('New message from ' + name,
        #                   sender=email,
        #                   recipients = [params['gmail-user']],
        #                   body = message + "\n" + phone
        #                   )

    return render_template('contact.html',params =params,sociallinks=sociallinks)

@app.route('/dashboard' , methods = ['GET', 'POST'])
def dashboard():
    if ('user' in session and session['user'] == params['user_name']):
        post = Posts.query.all()
        return render_template('dashboard.html',sociallinks=sociallinks, post = post , params =params)

    if(request.method == 'POST'):
        '''check this user is admin or not then'''
        username = request.form.get('email')
        pswrd = request.form.get('password')
        
        if (username==params['user_name'] and params['user_password']==pswrd):
            # set the session variable
            session['user'] = username
            post = Posts.query.all()
            # print("this have in json")
            return render_template('dashboard.html',sociallinks=sociallinks, post = post , params =params)
            
    return render_template('login.html',sociallinks=sociallinks , params =params)

@app.route("/edit/<string:sno>", methods = ['GET','POST'])
def edit(sno):
    if ('user' in session and session['user'] == params['user_name']):
        if request.method == 'POST':
            title = request.form.get('title')
            slug = request.form.get('slug')
            subhead = request.form.get('subhead')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date= datetime.now()
            
            if sno=='0':
                 post = Posts(sno=sno,title=title,slug=slug,subhead=subhead,content=content,date= date,img_file=img_file)
                 db.session.add(post)
                 db.session.commit()
            else:
                post=Posts.query.filter_by(sno=sno).first()
                post.title = title
                post.slug = slug
                post.content = content
                post.subhead = subhead
                post.img_file = img_file
                post.date = date
                db.session.commit()
                # return redirect('/edit/'+sno)
                return redirect('/dashboard')

        post=Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params =params,sno=sno ,post=post,sociallinks=sociallinks)

@app.route("/delete/<string:sno>", methods = ['GET','POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['user_name']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/dashboard')


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')
    

# @app.route('/login')
# def login():
#     return render_template('login.html', params =params,sociallinks=sociallinks)
# @app.route('/post')
# def post():
#     return render_template('post.html')


if __name__ == '__main__':
    app.run(host="0.0.0.0",debug=True,port=5000)