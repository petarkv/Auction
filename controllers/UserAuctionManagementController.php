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
            $auctionId = $auctionModel->add($addData);  
            
            if (!$auctionId) {
                $this->set('message', 'Auction is not added.');
                return;
            }

            $this->redirect(\Configuration::BASE . 'user/auctions');
        }


        public function getEdit($auctionId) {
            $auctionModel = new \App\Models\AuctionModel($this->getDatabaseConnection());
            $auction = $auctionModel->getById($auctionId);

            if (!$auction) {
                $this->redirect(\Configuration::BASE . 'user/auctions');
                return;
            }

            if ($auction->user_id != $this->getSession()->get('user_id')) {
                $this->redirect(\Configuration::BASE . 'user/auctions');
                return;
            } 

            /*$auction->starts_at = str_replace(' ', 'T', substr($auction->starts_at, 0, 16));
            $auction->ends_at = str_replace(' ', 'T', substr($auction->ends_at, 0, 16));*/
            
            $this->set('auction', $auction);

            $categoryModel = new \App\Models\CategoryModel($this->getDatabaseConnection());
            $categories = $categoryModel->getAll();
            $this->set('categories', $categories);
        }

        public function postEdit($auctionId) {
            $this->getEdit($auctionId);

            $editData = [
                'title' => filter_input(INPUT_POST, 'title', FILTER_SANITIZE_STRING),
                'description' => filter_input(INPUT_POST, 'description', FILTER_SANITIZE_STRING),
                'starting_price' => sprintf("%.2f", filter_input(INPUT_POST, 'starting_price', FILTER_SANITIZE_STRING)),
                'starts_at' => filter_input(INPUT_POST, 'starts_at', FILTER_SANITIZE_STRING),
                'ends_at' => filter_input(INPUT_POST, 'ends_at', FILTER_SANITIZE_STRING),
                'category_id' => filter_input(INPUT_POST, 'category_id', FILTER_SANITIZE_NUMBER_INT)                
            ];

            $auctionModel = new \App\Models\AuctionModel($this->getDatabaseConnection());

            $res = $auctionModel->editById($auctionId, $editData);
            
            if (!$res) {
                $this->set('message', 'Auction is not edited.');
                return;
            }

            $this->redirect(\Configuration::BASE . 'user/auctions');
        }
    }