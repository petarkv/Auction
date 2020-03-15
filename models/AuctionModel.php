<?php
    namespace App\Models;

    /*use App\Core\DatabaseConnection;*/
    use App\Core\Model;
    use App\Core\Field;
    use App\Validators\NumberValidator;
    use App\Validators\DateTimeValidator;
    use App\Validators\StringValidator;
    use App\Validators\BitValidator;
    
    class AuctionModel extends Model {
        protected function getFields(): array {
            return [
                'auction_id' => new Field((new NumberValidator())->setIntegerLength(10), false),
                'created_at' => new Field((new DateTimeValidator())->allowDate()->allowTime() , false),

                'title' => new Field((new StringValidator())->setMaxLength(255) ),
                'description' => new Field((new StringValidator())->setMaxLength(64*1024) ),
                'starting_price' => new Field((new NumberValidator())->setDecimal()
                                                                     ->setUnsigned()
                                                                     ->setIntegerLength(17)
                                                                     ->setMaxDecimalDigits(2) ),
                'starts_at' => new Field((new DateTimeValidator())->allowDate()->allowTime()),
                'ends_at' => new Field((new DateTimeValidator())->allowDate()->allowTime()),
                'is_active' => new Field(new BitValidator()),
                'category_id' => new Field((new NumberValidator())->setIntegerLength(11))
            ];
        }


        /*protected function getFields(): array {
            return [                
                'auction_id' => Field::readonlyInteger(10),
                'created_at' => Field::readonlyDateTime(),

                'title' => Field::editableString(256),
                'description' => Field::editableString(64*1024),
                'starting_price' => Field::editableMaxDecimal(17, 2),
                'starts_at' => Field::editableDate(),
                'ends_at' => Field::editableDate(),
                'is_activ' => Field::editableBit(),
                'category_id' => Field::editableInteger(10),
            ];
        }*/

        /*private $dbc;
    
        public function __construct(DatabaseConnection &$dbc)
        {
            $this->dbc = $dbc;
        }
    
        public function getById(int $auctionId) {
            $sql = 'SELECT * FROM auction WHERE auction_id = ?;';
            $prep = $this->dbc->getConnection()->prepare($sql);
            $res = $prep->execute([$auctionId]);
            $auction = NULL;
            if ($res) {
                $auction = $prep->fetch(\PDO::FETCH_OBJ);
            }
            return $auction;
        }
    
        public function getAll(): array {
            $sql = 'SELECT * FROM auction;';
            $prep = $this->dbc->getConnection()->prepare($sql);
            $res = $prep->execute();
            $auctions = [];
            if ($res) {
                $auctions = $prep->fetchAll(\PDO::FETCH_OBJ);
            }
            return $auctions;
        }

        public function getAllByCategoryId(int $categoryId): array {
            $sql = 'SELECT * FROM auction WHERE category_id = ?;';
            $prep = $this->dbc->getConnection()->prepare($sql);
            $res = $prep->execute([$categoryId]);
            $auctions = [];
            if ($res) {
                $auctions = $prep->fetchAll(\PDO::FETCH_OBJ);
            }
            return $auctions;
        }*/

        /*public function getAllByCategoryId(int $categoryId): array {
            $sql = 'SELECT * FROM auction WHERE category_id = ?;';
            $prep = $this->getConnection()->prepare($sql);
            $res = $prep->execute([$categoryId]);
            $auctions = [];
            if ($res) {
                $auctions = $prep->fetchAll(\PDO::FETCH_OBJ);
            }
            return $auctions;
        }*/

        public function getAllByCategoryId(int $categoryId): array {
            return $this->getAllByFieldName('category_id', $categoryId);            
        }

        public function getAllBySearch(string $keywords) {
            $sql = 'SELECT * FROM `auction` WHERE `title` LIKE ? OR `description` LIKE ?;';

            $keywords = '%' . $keywords . '%';

            $prep = $this->getConnection()->prepare($sql);
            if (!$prep) {
                return [];
            }

            $res = $prep->execute([$keywords, $keywords]);
            if (!$res) {
                return [];
            }

            return $prep->fetchAll(\PDO::FETCH_OBJ);
        }
    }