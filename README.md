# login_button

一个带有动画效果的登录按钮

## 思路
https://github.com/GeekyAnts/flutter-login-home-animation  
看了这个登陆界面之后，做一个效果类似的登录按钮widget。  
登录按钮点击后由长条变为圆形，登录过程中再次点击取消登陆。

## 实现细节
- LoginNotification
	- 用于登陆函数执行完成时，向控件发出通知，使登录按钮主动恢复原始状态；
	- 登陆成功后理应使用pushNamedAndRemoveUntil等函数实现界面切换，为预防特殊情况，登录成功后按钮同样需要恢复原始状态。
- LoginController
	- 此类为抽象类，实际使用过程中应创建子类，并重写其中的方法；  
	- 由Controller代替Widget原有的onTap，以便根据情况执行onLogin()和onCancel()，以及onLogin()执行完成后调用onSuccess()或者onFailed()；  
	- onLogin() 此方法应完成用户登录的网络请求，并根据返回情况调用onSuccess()或者onFailed()；
	- onCancel() 此方法需要实现用户在登录过程中再次点击，取消登陆。按钮默认为不可取消，如果将cancelable项设置为true，则需要重写此方法；  
	- onSuccess()和onFailed()由于涉及到发送通知，重写时必须调用父类方法。  
- LoginButton  
	- 根据布尔值_loading判断当前状态，执行onLogin()或者onCancel()；
	- 使用NotificationListener包装widget，当接收到LoginController发送的通知时，改变按钮状态。  

## 使用方法  
- 创建子类即成LoginController，根据需要重写父类方法（__onSuccess()和onFailed()必须重写并调用super方法__）；
- 创建LoginButton实例，按钮的颜色、内容、以及LoginController为必须项。



