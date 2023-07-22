import 'package:get/get.dart';

class BmiController extends GetxController
{
  RxBool male = false.obs;
  RxBool female = false.obs;
  RxDouble slider=50.0.obs;
  RxInt weight = 0.obs;
  RxInt age = 0.obs;

  void changeColorMale()
  {
    if(female==true)
    {
      male.value=false;
    }
    else
    {
      male.value==false?male.value=true:male.value=false;
    }
  }
  void changeColorFemale()
  {
    if(male==true)
    {
      female.value=false;
    }
    else
    {
      female.value==false?female.value=true:female.value=false;
    }
  }

  void changeSlider(double value)
  {
    slider.value=value;
  }

  void weightIncrease()
  {
    weight++;
    print(weight);
  }

  void weightDeIncrease()
  {
    if(weight>0)
    {
      weight--;
    }
  }

  void ageIncrease()
  {
    age++;
  }

  void ageDeIncrease()
  {
    if(age>0)
    {
      age--;
    }
  }

  RxDouble bmiValue = 20.0.obs;
  RxString bmiData = "normal".obs;
  void calculateBMI()
  {
    bmiValue.value  = (weight.value/ (slider.value * slider.value)) * 10000;

    if(bmiValue.value < 16)
    {
      bmiData.value = "Severe Thinness";
    }
    else if(bmiValue.value < 17 && bmiValue.value >= 16)
    {
      bmiData.value = "Moderate Thinness";
    }
    else if(bmiValue.value < 18.5 && bmiValue.value >= 17)
    {
      bmiData.value = "Mild Thinness";
    }
    else if(bmiValue.value < 25 && bmiValue.value >= 18.5)
    {
      bmiData.value = "Normal";
    }
    else if(bmiValue.value < 30 && bmiValue.value >= 25)
    {
      bmiData.value = "OverWeight";

    }
    else
    {
      bmiData.value = "Obese Class";
    }

    print(bmiData);

  }

}
