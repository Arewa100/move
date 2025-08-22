#[test_only]

module bookingapp::bookingapp_tests;


#[tests] 
fun test_create_user() {
    let ctx = @test_ctx;
    let user = Create_user("name", "email", "password", ctx);
}