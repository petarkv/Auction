<?php
    namespace App\Models;

    /*use App\Core\DatabaseConnection;*/
    use App\Core\Model;
    use App\Core\Field;
    use App\Validators\NumberValidator;
    use App\Validators\DateTimeValidator;
    
    class OfferModel extends Model {
        protected function getFields(): array {
            return [ 
                'offer_id' => new Field((new NumberValidator())->setIntegerLength(20), false),
                'created_at' => new Field((new DateTimeValidator())->allowDate()->allowTime() , false),

                'auction_id' => new Field((new NumberValidator())->setIntegerLength(10)),
                'user_id' => new Field((new NumberValidator())->setIntegerLength(10)),
                'price' => new Field((new NumberValidator())->setDecimal()
                                                            ->setUnsigned()
                                                            ->setIntegerLength(17)
                                                            ->setMaxDecimalDigits(2) )
                
                /*'offer_id' => Field::readonlyInteger(20),
                'created_at' => Field::readonlyDateTime(),
                
                'auction_id' => Field::editableInteger(10),
                'user_id' => Field::editableInteger(10),
                'price' => Field::editableMaxDecimal(17, 2),*/
            ];
        }


        /*private $dbc;
    
        public function __construct(DatabaseConnection &$dbc)
        {
            $this->dbc = $dbc;
        }
    
        public function getById(int $offerId) {
            $sql = 'SELECT * FROM offer WHERE offer_id = ?;';
            $prep = $this->dbc->getConnection()->prepare($sql);
            $res = $prep->execute([$offerId]);
            $offer = NULL;
            if ($res) {
                $offer = $prep->fetch(\PDO::FETCH_OBJ);
            }
            return $offer;
        }
    
        public function getAll(): array {
            $sql = 'SELECT * FROM offer;';
            $prep = $this->dbc->getConnection()->prepare($sql);
            $res = $prep->execute();
            $offers = [];
            if ($res) {
                $offers = $prep->fetchAll(\PDO::FETCH_OBJ);
            }
            return $offers;
        }*/

        /*public function getAllByAuctionId(int $auctionId): array {
            $sql = 'SELECT * FROM offer WHERE auction_id = ? ORDER BY created_at ASC;';
            $prep = $this->dbc->getConnection()->prepare($sql);
            $res = $prep->execute([$auctionId]);
            $offers = [];
            if ($res) {
                $offers = $prep->fetchAll(\PDO::FETCH_OBJ);
            }
            return $offers;
        }*/

        public function getAllByAuctionId(int $auctionId): array {
            $items = $this->getAllByFieldName('auction_id', $auctionId);
            #sort ASC
            usort($items, function($a, $b) {
                return strcmp($a->created_at, $b->created_at);
            });
            return $items;
        }

        public function getLastByAuctionId(int $auctionId) {
            $sql = 'SELECT * FROM `offer` WHERE `auction_id` = ? ORDER BY `created_at` DESC LIMIT 1;';
            $prep = $this->getConnection()->prepare($sql);

            if (!$prep) {
                return null;
            }

            $res = $prep->execute([ $auctionId ]);
            if (!$res) {
                return null;
            }

            return $prep->fetch(\PDO::FETCH_OBJ);
        }

        public function getLastOfferPrice($auction) {           
            $lastOffer = $this->getLastByAuctionId($auction->auction_id);

            if (!$lastOffer) {
                return $auction->starting_price;
            }

            return $lastOffer->price;
        }

    }