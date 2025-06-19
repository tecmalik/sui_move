
#[test_only]
module user::user_tests;

use user::user;

const ENotImplemented: u64 = 0;

#[test]
fun test_user() {
    pass
}

#[test, expected_failure(abort_code = ::user::user_tests::ENotImplemented)]
fun test_user_fail() {
    abort ENotImplemented
}

