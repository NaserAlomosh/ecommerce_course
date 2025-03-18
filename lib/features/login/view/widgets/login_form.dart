part of '../login_view.dart';

class _LoginFormWidget extends StatelessWidget {
  const _LoginFormWidget();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Welcome to ShopEase',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Discover amazing deals & shop effortlessly!',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              validator: (email) {
                if (email?.isEmpty ?? true) {
                  return 'Please enter your email';
                }
                return null;
              },
              controller: context.read<LoginCubit>().emailController,
              label: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: context.read<LoginCubit>().passwordController,
              validator: (password) {
                if (password?.isEmpty ?? true) {
                  return 'Please enter your password';
                }
                return null;
              },
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              label: 'Password',
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Forgot Password ?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                width: 200,
                text: 'Login',
                onTap: () {
                  // setState(() {});
                  context.read<LoginCubit>().login();
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account ?'),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignupView();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
