class DepartmentAndCourse{
  String? selectedCourse='1';
  String selectedDepartment = 'Bilgisayar Muhendisligi';
  Map<String,String> departmentOptions = {
    'Bilgisayar Mühendisliği':"01",
    'Çevre Mühendisliği':"03",
    'Kimya Mühendisliği':"04",
  };
  DepartmentAndCourse();

  getStudNumber(){
    return "${23-int.parse(selectedCourse!) - 1}04.${departmentOptions[selectedDepartment]}000";
  }
}