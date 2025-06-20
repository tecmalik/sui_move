
/// Module: wwtbas
module wwtbas::wwtbas{
    use std::debug;
    use std::string;
    use std::string::String;
    use std::vector;
    
    public struct Quiz has key, store {
    id: UID,
    questions: vector<String>
    }

   public fun new_quiz(ctx: &mut TxContext){
    let quiz= Quiz{
        id:object::new(ctx),
        questions: vector[],

    };
    debug::print(&quiz);
    transfer::public_transfer(quiz, ctx.sender());
      
   }

   public fun add_question(quiz: &mut Quiz, question:String) {
    let questions = &mut quiz.questions;
     questions.push_back(question);
        debug::print(questions);
      
   }
 
//    public fun get_question_size(quiz:Quiz): vector<String> {
//     quiz.questions
//    }

   #[test, expected_failure(abort_code = ::wwtbas::wwtbas_tests::ENotImplemented)]
    fun test_can_add_question_to_quiz() {
    let sender = @0x123;
    let scenario = test_scenario::begin(sender);
    let ctx = scenario.ctx();
    let quiz = wwtbas::Quiz {
        id: object::new(ctx),npmn
    };
    let question  = string::utf8(b"what is the capital of Malawi?");
    quiz.add_question(question);
    assert!(quiz.get_questions().len() > 0,0);

    }
}
