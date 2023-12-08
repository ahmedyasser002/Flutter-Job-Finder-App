class LocalStorageHelper{
  static saveString(String key , String value){
    localStorage.setString(key,value);
  }
}