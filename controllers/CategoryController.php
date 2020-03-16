<?php
    namespace App\Controllers;

    use App\Core\DatabaseConnection;
    use App\Models\CategoryModel;
    use App\Models\OfferModel;
    use App\Core\Controller;
    use App\Models\AuctionModel;

    class CategoryController extends Controller{
        
        public function show($id) {
            $categoryModel = new CategoryModel($this->getDatabaseConnection());
            $category = $categoryModel->getById($id);

            if (!$category) {
                header('Location: /AuctionProject/');
                exit;
            }

            $this->set('category', $category);

            $auctionModel = new AuctionModel($this->getDatabaseConnection());
            $auctionsInCategory = $auctionModel->getAllByCategoryId($id);

            $offerModel = new OfferModel($this->getDatabaseConnection());
            #$offerModel->getLastOfferPrice($auction);

            $auctionsInCategory = array_map(function($auction) use($offerModel) {
                $auction->last_offer_price = $offerModel->getLastOfferPrice($auction);
                return $auction;
            }, $auctionsInCategory);

            $this->set('auctionsInCategory', $auctionsInCategory);
        }
    }