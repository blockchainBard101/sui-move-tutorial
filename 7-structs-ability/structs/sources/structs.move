module structs::structs;
//structs abilitis 
public struct Student has key{
    id: UID,
    age: u8,
    isMale: bool,
    grades: Grades,
}

public struct Grades has drop, copy, store{
    math: u64,
    english: u64,
}

public fun create_grade(){
    let grade = Grades{
        math: 65,
        english: 89,
    };

    let mut grades2 = copy grade;
    grades2.english = 45;
    grades2.math  = 76;
}

public fun create_student(ctx: &mut TxContext){
    let student = Student{
        id: object::new(ctx),
        age: 16,
        isMale: true,
        grades: Grades{
            math: 70,
            english: 76,
        }
    };
    transfer::share_object(student);
    // transfer::public_share_object(student);
}



