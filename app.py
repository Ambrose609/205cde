from flask import Flask, render_template, request, flash, session, redirect, url_for
from flask_wtf import form
from forms import ContactForm
from wtforms import TextField, IntegerField, TextAreaField, SubmitField, RadioField, SelectField
from wtforms import validators, ValidationError
import pymysql
app = Flask(__name__)
app.secret_key = 'development key'
db = pymysql.connect('localhost', 'root', '', '205cde proj')

#test sample 
@app.route('/')
def home():
	return render_template('home1.html')
#test sample 
@app.route('/enternew')
def new_student():
   return render_template('student.html')

@app.route('/enternewuser')
def new_user():
   return render_template('user00001.html')

@app.route('/register001')
def register001():
   return render_template('register001.html')
#test sample 
@app.route('/addrec',methods = ['POST', 'GET'])
def addrec():
   if request.method == 'POST':
      try:
         nm = request.form['nm']
         addr = request.form['add']
         city = request.form['city']
         pin = request.form['pin']
         nm1 = request.form['nm1']
         addr1 = request.form['add1']
         city1 = request.form['city1']
         pin1 = request.form['pin1']
         nm12 = request.form['nm12']
         addr12 = request.form['add12']
         city12 = request.form['city12']
         pin12 = request.form['pin12']
         
         cursor = db.cursor()
         sql = '''
         INSERT INTO students (name,addr,city,pin,name1,addr1,city1,pin1,name12,addr12,city12,pin12) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')
         '''
         cursor.execute(sql%(nm,addr,city,pin,nm1,addr1,city1,pin1,nm12,addr12,city12,pin12) )
            
         db.commit()
         msg = "Record successfully added"
      except:
         db.rollback()
         msg = "error in insert operation"
      
      finally:
         return render_template("result.html",msg = msg)
         db.close()

@app.route('/addrec1',methods = ['POST', 'GET'])
def addrec1():
   if request.method == 'POST':
      try:
         nm = request.form['nm']
         email = request.form['email']
         password = request.form['password']
         address = request.form['address']
         district = request.form['District']
         CardType = request.form['CardType']
         creditcard = request.form['creditcard']
         CardOwner = request.form['CardOwner']
         PhoneNo = request.form['PhoneNo']


         cursor = db.cursor()
         sql = '''
         INSERT INTO user (name,email,password,Address,District,CardType,CreditCard,CardOwner,PhoneNo) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s')
         '''
         cursor.execute(sql%(nm,email,password,address,district,CardType,creditcard,CardOwner,PhoneNo) )
            
         db.commit()
         msg = "You are our new member now! The information will make the payment proceess faster!"
      except:
         db.rollback()
         msg = "Some Error Occuped!  >.<"
      
      finally:
         return render_template("AfterSignUp.html",msg = msg)
         db.close()

@app.route('/addorder',methods = ['POST', 'GET'])
def addorder():
	if request.method == 'POST':
			Orderitem = request.form['orderitem']
			OrderPrice = request.form['orderprice']
			Name = request.form['custname']
			Email = request.form['email']
			Address = request.form['address']
			District = request.form['district']
			CardType = request.form['CardType']
			Creditcard = request.form['creditcard']
			ExpirationDate = request.form['cardexdate']
			CVC = request.form['CVC']
			CardOwner = request.form['CardOwner']
			PhoneNo = request.form['PhoneNo']

			cursor = db.cursor()
			sql = '''
			INSERT INTO order001 (OrderItem,TotalPrice,itemname,custemail,custaddr,district,creditcarttype,custcardno,cardexdate,CVC,cardowner,phoneNo) VALUES ("'+%s+'",'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')
			'''
			cursor.execute(sql%(Orderitem,OrderPrice,Name,Email,Address,District,CardType,Creditcard,ExpirationDate,CVC,CardOwner,PhoneNo))

			sql = ("DELETE FROM cart")
			cursor.execute(sql)

			db.commit()
			session.pop('totalPrice', None)
			session.pop('totalItem', None)
			msg = "Thanks to buy Games here! We will send the game to your address as quick as possible"


			return render_template("AfterSignUp.html",msg = msg)
			db.close()




#test sample 
@app.route('/list')
def list():
   	cursor = db.cursor()
   	sql = ("SELECT * FROM ns_game")
   	cursor.execute(sql)
   	db.commit()
   	rows = cursor.fetchall()
   	return render_template("list.html",rows = rows)


@app.route('/result')
def result():
	return render_template('result.html')

@app.route('/AfterLogin')
def AfterLogin():
	return render_template('AfterLogin.html')


#test sample 
@app.route('/contact', methods = ['GET', 'POST'])
def contact():
	form = ContactForm()

	if request.method == 'POST':
		if form.validate() == False:
			flash('All fields are required.')
			return render_template('contact.html', form = form)
		else:
			return render_template('result.html')

	return render_template('contact.html', form = form)


@app.route('/index', methods = ['POST', 'GET']) 
def index():
	return render_template('index.html')

@app.route('/header2', methods = ['POST', 'GET']) 
def header2():
	return render_template('header2.html')

@app.route('/nav', methods = ['POST', 'GET']) 
def nav():
	return render_template('nav.html')

@app.route('/content', methods = ['POST', 'GET']) 
def content():
	cursor = db.cursor()
	sql = ("SELECT * FROM game ORDER BY Date1 DESC LIMIT 3 ")
	cursor.execute(sql)
	db.commit()
	rows = cursor.fetchall()
	return render_template('content.html', rows = rows)

@app.route('/footer', methods = ['POST', 'GET']) 
def footer():
	return render_template('footer.html')

@app.route('/NStest001', methods = ['POST', 'GET']) 
def NStest001():
	cursor = db.cursor()
	sql = ("SELECT * FROM game WHERE platform = 'NS'")
	cursor.execute(sql)
	db.commit()
	rows = cursor.fetchall()

	results = cursor.fetchall()
	for row in results:
		gameID = row[0]
		gameName = row[1]
		gameDate = row[4]
		gamePrice = row[2]





	return render_template('NStest001.html', rows = rows)

@app.route('/ShoppingCart001', methods = ['POST', 'GET']) 
def ShoppingCart001():
	if 'em' in session:
		cursor = db.cursor()
		sql = ("SELECT * FROM cart")
		cursor.execute(sql)
		db.commit()
		rows = cursor.fetchall()
		totalPrice = 0
		totalItem = []

		for row in rows:
			totalPrice += row[1]
			totalItem.append(row[0])

			session['totalPrice'] = totalPrice
			session['totalItem'] = totalItem


		return render_template('MemberShoppingCart.html', rows = rows,result = result, totalPrice = totalPrice, totalItem = totalItem)

	else:
		cursor = db.cursor()
		sql = ("SELECT * FROM cart")
		cursor.execute(sql)
		db.commit()
		rows = cursor.fetchall()
		totalPrice = 0
		totalItem = []

		for row in rows:
			totalPrice += row[1]
			totalItem.append(row[0])
			session['totalPrice'] = totalPrice
			session['totalItem'] = totalItem

		return render_template('ShoppingCart001.html', rows = rows,result = result, totalPrice = totalPrice, totalItem = totalItem)


@app.route('/MemberShoppingCart', methods = ['POST', 'GET']) 
def MemberShoppingCart():
	return render_template('MemberShoppingCart.html')

@app.route('/payment_non_member', methods = ['POST', 'GET']) 
def payment_non_member():
	if 'totalItem' in session:
		return render_template('payment_non_member.html')
	else:
		msg = "You have put anything in the cart!"
		return render_template('AfterSignUp.html', msg = msg)

@app.route('/payment_member', methods = ['POST', 'GET']) 
def payment_member():
	if 'totalItem' in session:
		em = session['em']
		cursor = db.cursor()
		sql = ("SELECT * FROM user WHERE email = '"+em+"' ")
		cursor.execute(sql)
		db.commit()
		rows = cursor.fetchall()
		return render_template('payment_member.html', rows = rows)
	else:
		msg = "You have put anything in the cart!"
		return render_template('AfterSignUp.html', msg = msg)

@app.route('/PS4', methods = ['POST', 'GET']) 
def PS4():
	cursor = db.cursor()
	sql = ("SELECT * FROM game WHERE platform = 'ps4'")
	cursor.execute(sql)
	db.commit()
	rows = cursor.fetchall()

	return render_template('PS4.html', rows = rows)

@app.route('/PS33DS', methods = ['POST', 'GET']) 
def PS33DS():
	cursor = db.cursor()
	sql = ("SELECT * FROM game WHERE platform IN ('3ds', 'PS3')")
	cursor.execute(sql)
	db.commit()
	rows = cursor.fetchall()

	return render_template('PS33DS.html', rows = rows)


@app.route('/Hardware', methods = ['POST', 'GET']) 
def Hardware():
	return render_template('Hardware.html')

@app.route('/LoginP', methods = ['POST', 'GET']) 
def LoginP():
	if 'em' in session:
		if session['em'] == 'ambrose609@gmail.com':
			return render_template('AdminLogin.html')
		else:
			return render_template('loginuser.html')

	else:
		return render_template('LoginP.html')

@app.route('/LogOut', methods = ['POST', 'GET']) 
def LogOut():
	session.pop('em', None)
	return render_template('AfterLogout.html')

@app.route('/AdminLogin', methods = ['POST', 'GET']) 
def AdminLogin():
	return render_template('AdminLogin.html')

@app.route('/AdminCheckUserInfo', methods = ['POST', 'GET']) 
def AdminCheckUserInfo():
	em = session['em']
	cursor = db.cursor()
	sql = ("SELECT * FROM user WHERE NOT email = '"+em+"' ")
	cursor.execute(sql)
	db.commit()
	rows = cursor.fetchall()
	return render_template('AdminCheckUserInfo.html', rows = rows)

@app.route('/AdminCheckGameInfo', methods = ['POST', 'GET']) 
def AdminCheckGameInfo():
	em = session['em']
	cursor = db.cursor()
	sql = ("SELECT * FROM game ")
	cursor.execute(sql)
	db.commit()
	rows = cursor.fetchall()
	return render_template('AdminCheckGameInfo.html', rows = rows)

@app.route('/AdminCheckOrder', methods = ['POST', 'GET']) 
def AdminCheckOrder():
	em = session['em']
	cursor = db.cursor()
	sql = ("SELECT * FROM order001")
	cursor.execute(sql)
	db.commit()
	rows = cursor.fetchall()
	return render_template('AdminCheckOrder.html', rows = rows)

@app.route('/AddGameInfoPage', methods = ['POST', 'GET']) 
def AddGameInfoPage():
	return render_template('AddGameInfoPage.html')

@app.route('/AddGameInfo',methods = ['POST', 'GET'])
def AddGameInfo():
   if request.method == 'POST':
      try:
         Gid = request.form['gid']
         Gname = request.form['gname']
         Price = request.form['price']
         Amount = request.form['amount']
         Date1 = request.form['date1']
         YouTubeGamePlay = request.form['YouTubeGamePlay']
         GameDescription = request.form['GameDescription']
         Platform = request.form['platform']


         cursor = db.cursor()
         sql = '''
         INSERT INTO game (id,name,price,amount,date1,YouTubeGamePlay,GameDescription,platform) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s')
         '''
         cursor.execute(sql%(Gid,Gname,Price,Amount,Date1,YouTubeGamePlay,GameDescription,Platform) )
            
         db.commit()
         msg = "You have add one Game to sell"
      except:
         db.rollback()
         msg = "Some Error Occuped!  >.<"
      
      finally:
         return render_template("AfterSignUp.html",msg = msg)
         db.close()



@app.route('/loginuser', methods = ['POST', 'GET']) 
def loginuser():
	return render_template("loginuser.html")

@app.route('/UserInformation', methods = ['POST', 'GET']) 
def UserInformation():
	if 'em' in session:
		em = session['em']
		cursor = db.cursor()
		sql = ("SELECT * FROM user WHERE email = '"+em+"' ")
		cursor.execute(sql)
		db.commit()
		rows = cursor.fetchall()
		return render_template("UserInformation.html", rows = rows)
	else:
		return render_template('NOTIN.html')

@app.route('/AfterLogout', methods = ['POST', 'GET']) 
def AfterLogout():
	return render_template('AfterLogout.html')

@app.route('/NOTIN', methods = ['POST', 'GET']) 
def NOTIN():
	return render_template("NOTIN.html")

@app.route('/register', methods = ['POST', 'GET']) 
def register():
	return render_template('register.html')

#test sample 
@app.route('/Sign', methods = ['POST', 'GET'])
def Sign():
   if request.method == 'POST':
      try:
         email = request.form['E-mail']
         username = request.form['Name']
         password = request.form['pass1']
         address = request.form['address']
         District = request.form['District']
         CardType = request.form['CardType']
         cardno = request.form['cardno']
         ExpirationDate = request.form['ExpirationDate']
         CvCode = request.form['CvCode']
         CardOwner = request.form['CardOwner']

         
         
         
         cursor = db.cursor()
         sql = '''
         INSERT INTO login (email,username,password,address,District,CardtType,cardno,ExpirationDate,CvCode,CardOwner) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')
         '''
         cursor.execute(sql%(email,username,password,address,District,CardType,cardno,ExpirationDate,CvCode,CardOwner) )
            
         db.commit()
         msg = "Record successfully added"
      except:
         db.rollback()
         msg = "error in insert operation"
      
      finally:
         return render_template("result.html",msg = msg)
         db.close()

@app.route('/loginING', methods = ['POST', 'GET'])
def loginING():
	if request.method == 'POST':
			em = request.form["em"]
			pwd = request.form['password']
			custemail = None

			cursor = db.cursor()

			sql = ("SELECT email, password FROM `user` WHERE email = '"+em+"' ")
			cursor.execute(sql)

			db.commit()
			results = cursor.fetchall()
			for row in results:
				custemail = row[0]

			if custemail is None:
				msg = "You have not register!!!"
				return render_template('AfterSignUp.html', msg = msg)
			else:
				if request.form["em"] == row[0] and request.form['password'] == row[1]:
					if request.form["em"] == "ambrose609@gmail.com":
						for row in results:
							custemail = row[0]
							custPassword = row[1]
							#print ("Customer Name = %s, Password = %s % (custName, custPassword"))
							session['em'] = custemail
							return redirect(url_for('AdminLogin', guest = custemail))

					else:
						for row in results:
							custemail = row[0]
							custPassword = row[1]
							#print ("Customer Name = %s, Password = %s % (custName, custPassword"))
							session['em'] = custemail
							return redirect(url_for('loginuser', guest = custemail))

				else:
					msg = "Invaild email / password"
					return render_template("AfterSignUp.html", msg = msg)



@app.route('/addItem', methods = ['POST', 'GET'])
def addItem():
	if request.method == 'POST':
	    try:
	      GName = request.form['GameName']
	      GPrice = request.form['GamePrice']
	      GDate = request.form['GameDate']
	      

	      cursor = db.cursor()
	      sql = '''
	      INSERT INTO cart (name, price, date01) VALUES ('%s','%s','%s')
	      '''

	      cursor.execute(sql%(GName,GPrice,GDate))

	      db.commit()
	      msg = "successfully added to cart!"
	    except:
	      db.rollback()
	      msg = "Error >.<"

	    finally:
	      active = 1
	      session['cart'] = active
	      return render_template("AfterSignUp.html", msg = msg)
	      db.close()

@app.route('/removeItem', methods = ['POST', 'GET']) 
def removeItem():
	if request.method == 'POST':
		try:
			GName = request.form['GameName']
			GPrice = request.form['GamePrice']
			GDate = request.form['GameDate']

			cursor = db.cursor()
			sql = ("DELETE FROM cart WHERE name= '"+GName+"' ")
			cursor.execute(sql)

			db.commit()
			msg = "successfully delete item from cart!"
		except:
			db.rollback()
			msg = "Error >.<"

		finally:
			session.pop('totalPrice', None)
			session.pop('totalItem', None)
			return render_template("AfterSignUp.html", msg = msg)
			db.close()

@app.route('/removeAllItem', methods = ['POST', 'GET']) 
def removeAllItem():
	if request.method == 'POST':

			cursor = db.cursor()
			sql = ("DELETE FROM `cart`")
			cursor.execute(sql)

			db.commit()
			msg = "successfully delete all item from cart!"
			session.pop('totalPrice', None)
			session.pop('totalItem', None)

			return render_template("AfterSignUp.html", msg = msg)
			db.close()

@app.route('/RemoveAllOrder', methods = ['POST', 'GET']) 
def RemoveAllOrder():
	if request.method == 'POST':
			checkorder = None
			cursor = db.cursor()
			sql = ("DELETE FROM `order001`")
			cursor.execute(sql)

			db.commit()
			results = cursor.fetchall()
			for row in results:
				checkorder = row[0]

			if checkorder is None:
				msg = "Nothing in the order =v=............"
				return render_template('AfterSignUp.html', msg = msg)

			else:
				msg = "successfully delete all item from order001!"
				return render_template("AfterSignUp.html", msg = msg)
				db.close()

if __name__ =='__main__':
	app.run(debug = True)

