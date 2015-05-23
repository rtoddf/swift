#include <stdio.h>

// here is the declaration of the type of person
typedef struct {
    float heightInMeters;
    int weightInKilos;
} Person;

//struct Person {
//    float heightInMeters;
//    int weightInKilos;
//};

float bodyMassIndex(Person p){
    return p.weightInKilos / (p.heightInMeters * p.heightInMeters);
}

int main(int argc, const char * argv[]) {
//    struct Person mikey;
    Person mikey;
    mikey.heightInMeters = 1.7;
    mikey.weightInKilos = 96;

//    struct Person aaron;
    Person aaron;
    aaron.heightInMeters = 1.97;
    aaron.weightInKilos = 84;
    
    float bmi;
    bmi = bodyMassIndex(mikey);
    
    printf("Mikey is %f meters in height.\n", mikey.heightInMeters);
    printf("Mikey weighs %d kilograms.\n", mikey.weightInKilos);
    printf("Mikey's bmi is %f.\n", bmi);
    
    bmi = bodyMassIndex(aaron);
    
    printf("Aaron is %f meters in height.\n", aaron.heightInMeters);
    printf("Aaron weighs %d kilograms.\n", aaron.weightInKilos);
    printf("Aaron's bmi is %f.\n", bmi);
    
    return 0;
}
