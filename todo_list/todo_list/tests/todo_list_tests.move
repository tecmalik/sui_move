
#[test_only]
module todo_list::todo_list {
    use std::string::String;
    use std::debug;

    public struct TodoList has key, store {
        id: UID,
        items: vector<String>
    }


    #[test]
    fun test_create_list() {
        let ctx = &mut tx_context::dummy();
        let list = new(ctx);
        assert!(length(&list) == 0, 1);
    }

    #[test]
    fun test_add_items() {
        let ctx = &mut tx_context::dummy();
        let mut list = new(ctx);
        
        add(&mut list, string::utf8(b"Buy milk"));
        add(&mut list, string::utf8(b"Walk dog"));
        
        assert!(length(&list) == 2, 1);
    }

    #[test]
    fun test_remove_item() {
        let ctx = &mut tx_context::dummy();
        let mut list = new(ctx);
        
        add(&mut list, string::utf8(b"Task 1"));
        add(&mut list, string::utf8(b"Task 2"));
        
        let removed = remove(&mut list, 0);
        assert!(removed == string::utf8(b"Task 1"), 1);
        assert!(length(&list) == 1, 2);
    }

    #[test, expected_failure]
    fun test_remove_invalid_index() {
        let ctx = &mut tx_context::dummy();
        let mut list = new(ctx);
        
        add(&mut list, string::utf8(b"Task 1"));
        remove(&mut list, 1); 
    }
}