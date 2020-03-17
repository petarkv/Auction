<?php
    namespace App\Controllers;

    class UserAuctionManagementController extends \App\Core\Role\UserRoleController {
        public function auctions() {
            $userId = $this->getSession()->get('user_id');
                        

            $auctionModel = new \App\Models\AuctionModel($this->getDatabaseConnection());
            $auctions = $auctionModel->getAllByUserId($userId);

            $this->set('auctions', $auctions);

            
        }

        public function getAdd() {
            $categoryModel = new \App\Models\CategoryModel($this->getDatabaseConnection());
            $categories = $categoryModel->getAll();
            $this->set('categories', $categories);
        }

        public function postAdd() {
            $addData = [
                'title' => filter_input(INPUT_POST, 'title', FILTER_SANITIZE_STRING),
                'description' => filter_input(INPUT_POST, 'description', FILTER_SANITIZE_STRING),
                'starting_price' => sprintf("%.2f", filter_input(INPUT_POST, 'starting_price', FILTER_SANITIZE_STRING)),
                'starts_at' => filter_input(INPUT_POST, 'starts_at', FILTER_SANITIZE_STRING),
                'ends_at' => filter_input(INPUT_POST, 'ends_at', FILTER_SANITIZE_STRING),
                'category_id' => filter_input(INPUT_POST, 'category_id', FILTER_SANITIZE_NUMBER_INT),
                'user_id' => $this->getSession()->get('user_id')
            ];

            #print_r($addData);
            #exit;

            $auctionModel = new \App\Models\AuctionModel($this->getDatabaseConnection());
            $auctions = $auctionModel->add($addData);  
            
            if (!$auctionId) {
                $this->set('message', 'Auction is not added.');
                return;
            }

            $this->redirect(\Configuration::BASE . 'user/auctions');
        }
    }