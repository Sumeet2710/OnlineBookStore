$(document).ready(function () {
    $('#loginbtn').click(function (e) {
        if ($('#usrid').val() == '') {
            e.preventDefault();
            swal({
                title: "Error!.",
                text: "UserName Field is Empty",
                icon: "error",
                button: "OK",
            });
        }
        else if ($('#password').val() == '') {
            e.preventDefault();
            swal({
                title: "Error!.",
                text: "Password Field is Empty",
                icon: "error",
                button: "OK",
            });
            }
    });
    //Register
    $('#registerbtn').click(function (e) {
        var password = $("#password").val();
        var confirmPassword = $("#password1").val();
        var contact = $("#contact").val();
        var email = $("#mail").val();

        if ($('#usrid').val().trim() == '') {
            e.preventDefault();
            swal({
                title: "Error!.",
                text: "UserName Field is Empty",
                icon: "error",
                button: "OK",
            });
        }
        else if ($('#password').val().trim() == '') {
            e.preventDefault();
            swal({
                title: "Error!.",
                text: "Password Field is Empty",
                icon: "error",
                button: "OK",
            });
        }
        else if ($('#password1').val().trim() == '') {
            e.preventDefault();
            swal({
                title: "Error!.",
                text: "Confirm Password Field is Empty",
                icon: "error",
                button: "OK",
            });
        }
        else if ($('#firstname').val().trim() == '') {
            e.preventDefault();
            swal({
                title: "Error!.",
                text: "First Name Field is Empty",
                icon: "error",
                button: "OK",
            });
        }
        else if ($('#lastname').val().trim() == '') {
            e.preventDefault();
            swal({
                title: "Error!.",
                text: "Last Name Field is Empty",
                icon: "error",
                button: "OK",
            });
        }
        else if ($('#contact').val().trim() == '') {
            e.preventDefault();
            swal({
                title: "Error!.",
                text: "Contact Field is Empty",
                icon: "error",
                button: "OK",
            });
        }
        else if ($('#mail').val().trim() == '') {
            e.preventDefault();
            swal({
                title: "Error!.",
                text: "Email Field is Empty",
                icon: "error",
                button: "OK",
            });
        }
        else if (password != confirmPassword) {
            e.preventDefault();
            swal({
                title: "Invalid Password!.",
                text: "Password Doesn't Match",
                icon: "error",
                button: "OK",
            });
        }
        else if (contact.length != 10) {
            e.preventDefault();
            swal({
                title: "Invalid Contact!.",
                text: "Please check Contact Number",
                icon: "error",
                button: "OK",
            });
        }
        else if (validateEmailAddress(email)) {
            return true;
        }
        else {
            e.preventDefault();
            swal({
                title: "Invalid Email Address!!",
                text: "Please enter valid email e.g abc@domain.com",
                icon: "error",
                button: "OK",
            });
            return false;
        }
    });

    $('#ForgetBtn').click(function (e) {

        if ($('#resetemail').val().trim() == '') {
            e.preventDefault();
            swal({
                title: "Error!.",
                text: "Please Enter Email",
                icon: "error",
                button: "OK",
            });
        }
    });
    function validateEmailAddress(email) {
        var expr = /^[a-zA-Z0-9._]+[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,4}$/;
        if (expr.test(email)) {
            return true;
        }
        else {
            return false;
        }
    }


});
