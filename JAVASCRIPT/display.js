        function showAdditionalFields() {
            var email = document.getElementById('email').value;
            
            if (email) {
                document.getElementById('emailSection').classList.add('hidden');
                document.getElementById('additionalFields').classList.remove('hidden');
            } else {
                alert("Please enter a valid email.");
            }
        }

        function submitForm() {
            var username = document.getElementById('username').value;
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var gender = document.querySelector('input[name="gender"]:checked');

            if (!gender) {
                alert("Please select your gender.");
                return;
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return;
            }

            console.log("Username:", username);
            console.log("Email:", email);
            console.log("Password:", password);
            console.log("Confirm Password:", confirmPassword);
            console.log("Gender:", gender.value);

            // Show success message
            $('#successModal').modal('show');
        }
    