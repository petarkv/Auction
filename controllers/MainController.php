<?php
    namespace App\Controllers;

    use App\Core\DatabaseConnection;
    use App\Models\CategoryModel;
    use App\Core\Controller;
    use App\Models\AuctionViewModel;
    use App\Validators\StringValidator;
    use App\Models\UserModel;

    class MainController extends Controller{
        
        public function home() {
            $categoryModel = new CategoryModel($this->getDatabaseConnection());
            $categories = $categoryModel->getAll();
            $this->set('categories', $categories);

            /*$auctionViewModel = new AuctionViewModel($this->getDatabaseConnection());
            $auctionViewModel->editById(8, [
                'user_agent' => 'Chrome'
            ]);*/


            /*$auctionModel = new \App\Models\AuctionModel($this->getDatabaseConnection());
            $auctionModel->add([
                'title'           => 'Lovac u zitu',
                'description'     => 'Pobuna...',
                'starting_price'  => '985.5',
                'starts_at'       => '2020-03-10 11:09:50',
                'ends_at'         => '2020-03-18 11:09:50',
                'is_active'       => '1',
                'category_id'     =>  1
            ]);*/

            //$this->getSession()->put('neki_kljuc', 'Neka vrednost ' . rand(100, 999));  
            
            /*$staraVrednost = $this->getSession()->get('brojac', 0);
            $novaVrednost = $staraVrednost + 1;
            $this->getSession()->put('brojac', $novaVrednost);

            $this->set('podatak', $novaVrednost); */
        }

        /* REGISTRATION */
        public function getRegister() {

        }

        public function postRegister() {
            $email     = \filter_input(INPUT_POST, 'reg_email', FILTER_SANITIZE_EMAIL);
            $forename  = \filter_input(INPUT_POST, 'reg_forename', FILTER_SANITIZE_STRING);
            $surname   = \filter_input(INPUT_POST, 'reg_surname', FILTER_SANITIZE_STRING);
            $username  = \filter_input(INPUT_POST, 'reg_username', FILTER_SANITIZE_STRING);
            $password1 = \filter_input(INPUT_POST, 'reg_password_1', FILTER_SANITIZE_STRING);
            $password2 = \filter_input(INPUT_POST, 'reg_password_2', FILTER_SANITIZE_STRING);

            /*print_r([$email, $forename, $surname, $username, $password1, $password2]);*/
            

            if ($password1 !== $password2) {
                $this->set('message', 'Error: You did not enter the same Password.');
                return;
            }
            
            $validanPassword = (new StringValidator())
                ->setMinLength(6)
                ->setMaxLength(50)
                ->isValid($password1);
                
            if ( !$validanPassword) {
                $this->set('message', 'Error: You did not enter the correct format for Password.');
                return;
            }

            $userModel = new UserModel($this->getDatabaseConnection());

            $user = $userModel->getByFieldName('email', $email);
            if ($user) {
                $this->set('message', 'Error: There is a User with the same e-mail.');
                return;
            }

            $user = $userModel->getByFieldName('username', $username);
            if ($user) {
                $this->set('message', 'Error: There is a User with the same username.');
                return;
            }

            $passwordHash = \password_hash($password1, PASSWORD_DEFAULT);

            $userId = $userModel->add([
                'username'      => $username,
                'password' => $passwordHash,
                'email'         => $email,
                'forename'      => $forename,
                'surname'       => $surname
            ]);

            if (!$userId) {
                $this->set('message', 'Error: User Registration is failed.');
                return;
            }
            $this->set('message', 'Done. You are registered and You can now Login.');            
        } 
        
        /* LOGIN */

        public function getLogin() {

        }

        public function postLogin() {
            $username = filter_input(INPUT_POST, 'login_username', FILTER_SANITIZE_STRING);
            $password = filter_input(INPUT_POST, 'login_password', FILTER_SANITIZE_STRING);


            $validanPassword = (new StringValidator())
                ->setMinLength(6)
                ->setMaxLength(50)
                ->isValid($password);
            
            if ( !$validanPassword) {
                $this->set('message', 'Error: You did not enter the correct format for Password.');
                return;
            }

            $userModel = new UserModel($this->getDatabaseConnection());

            $user = $userModel->getByFieldName('username', $username);

            /*print_r($user);
            exit;*/

            if (!$user) {
                $this->set('message', 'Error: There is not a User with this Username.');
                return;
            }
            
            $passwordHash = $user->password;
            if (!\password_verify($password, $passwordHash)) {
                sleep(1);
                $this->set('message', 'Error: Password is not correct.');
                return;
            }

            $this->getSession()->put('user_id', $user->user_id);
            $this->getSession()->save();

            $this->redirect(\Configuration::BASE . 'user/profile');
        }
    }
