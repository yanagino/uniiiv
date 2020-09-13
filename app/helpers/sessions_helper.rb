module SessionsHelper
  def current_user
   @current_user ||= User.find_by(uid: session[:uid])
   #||は、もし今@current_userでログインしているならばそのまま、ログインしていなければ新たに定義してあげてね、ということ。もしいなければnilの値で返される。nilガードと呼ばれる。でもこれ、別にif文がnilでもfalse判定してくれるのであれば、別にいらなくね？何かいいことがあるのだろうか？
  end
  
  def logged_in?
    !!current_user
    #インスタンスが返される→false→true：すなはち、ユーザーがいればtrue
    #nilで返される→true→flase：すなはち、ユーザーがいなければfalase
    #viewの条件分岐でよく使用される。これをするためにはcurrent_userメソッドが必要なのでヘルパーに記載している。必要であればコントローラーにincludeすればよい。
  end

  def status_resigned?
    !!current_user.status
    #高校生か大学生か登録している？
  end

  def seniors?
    if current_user.status == "seniors"
      return true
    else
      return false
    end
  end

  def juniors?
    if current_user.status == "juniors"
      return true
    else
      return false
    end
  end

end
