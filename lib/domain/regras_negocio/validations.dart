class  cpf_or_name {

  static bool isCpf(String data){
    try{
      int.tryParse(data) !/ 2;
      return true;
    }catch(Exception ){
    return false;
    }
  }

}