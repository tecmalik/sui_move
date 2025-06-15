#[test_only]
module todo_list::todo_list_tests {
    use todo_list::todo_list;
    use std::string;

    #[test]
    fun test_create_list() {
        let ctx = &mut tx_context::dummy();
        let list = todo_list::new(ctx);
        assert!(todo_list::length(&list) == 0, 1);
        todo_list::delete(list);
    }

    #[test]
    fun test_add_items() {
        let ctx = &mut tx_context::dummy();
        let mut list = todo_list::new(ctx);
        
        todo_list::add(&mut list, string::utf8(b"Buy milk"));
        todo_list::add(&mut list, string::utf8(b"Walk dog"));
        
        assert!(todo_list::length(&list) == 2, 1);
        todo_list::delete(list);
    }

    #[test]
    fun test_remove_item() {
        let ctx = &mut tx_context::dummy();
        let mut list = todo_list::new(ctx);
        
        todo_list::add(&mut list, string::utf8(b"Task 1"));
        todo_list::add(&mut list, string::utf8(b"Task 2"));
        
        let removed = todo_list::remove(&mut list, 0);
        assert!(removed == string::utf8(b"Task 1"), 1);
        assert!(todo_list::length(&list) == 1, 2);
        todo_list::delete(list);
    }

    #[test, expected_failure]
    fun test_remove_invalid_index() {
        let ctx = &mut tx_context::dummy();
        let mut list = todo_list::new(ctx);
        
        todo_list::add(&mut list, string::utf8(b"Task 1"));
        let _ = todo_list::remove(&mut list, 1); 
        todo_list::delete(list); 
}
}