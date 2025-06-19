
/// Module: user
module user::user{
    use std::string::String;

public struct User has key, store{
    id : UID,
    name : vector<String>,
    password : vector<String>

}

public fun new_user(ctx: &mut TxContext): User{
    // let list = User{
    
    // }

}





}

