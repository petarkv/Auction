<?php
    namespace App\Controllers;

    use App\Core\DatabaseConnection;
    use App\Models\CategoryModel;
    use App\Core\Controller;
    use App\Models\AuctionModel;
    use App\Models\OfferModel;
    use App\Models\AuctionViewModel;

    class AuctionController extends Controller{
        
        public function show($id) {
            $auctionModel = new AuctionModel($this->getDatabaseConnection());
            $auction = $auctionModel->getById($id);

            if (!$auction) {
                header('Location: /AuctionProject/');
                exit;
            }

            $this->set('auction', $auction);

            /*$lastOfferPrice = $this->getLastOfferPrice($auction);
            if (!$lastOfferPrice) {
                $lastOfferPrice = $auction->starting_price;
            }*/

            $offerModel = new OfferModel($this->getDatabaseConnection());
            $lastOfferPrice = $offerModel->getLastOfferPrice($auction);
            
            $this->set('lastOfferPrice', $lastOfferPrice);

            $auctionViewModel = new AuctionViewModel($this->getDatabaseConnection());

            $ipAddress = filter_input(INPUT_SERVER, 'REMOTE_ADDR');
            $userAgent = filter_input(INPUT_SERVER, 'HTTP_USER_AGENT');

            $auctionViewModel->add(
                [
                    'auction_id' => $id,
                    'ip_address' => $ipAddress,
                    'user_agent' => $userAgent                                   
                ]
            );
            
        }

        /*private function getLastOfferPrice($auction) {
            $offerModel = new OfferModel($this->getDatabaseConnection());
            $lastOffer = $offerModel->getLastByAuctionId($auction->auction_id);

            if ($lastOffer === null) {
                return $auction->starting_price;
            }

            return $lastOffer->price;

            /*$offers = $offerModel->getAllByAuctionId($auctionId);
            $lastPrice = 0;
            foreach($offers as $offer) {
                if ($lastPrice < $offer->price) {
                    $lastPrice = $offer->price;
                }
            }
            return $lastPrice;
        }*/

        private function normaliseKeywords(string $keywords): string {
            $keywords = trim($keywords);
            $keywords = preg_replace('/ +/', ' ', $keywords);
            return $keywords;
        }

        public function postSearch() {
            $auctionModel = new AuctionModel($this->getDatabaseConnection());

            $q = filter_input(INPUT_POST, 'q', FILTER_SANITIZE_STRING);

            $keywords = $this->normaliseKeywords($q);

            $auctions = $auctionModel->getAllBySearch($q);

            /*print_r($auctions);
            exit;*/

            $this->set('auctions', $auctions);
        }
    }