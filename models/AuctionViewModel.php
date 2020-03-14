<?php
    namespace App\Models;
   
    use App\Core\Model;
    use App\Core\Field;
    use App\Validators\NumberValidator;
    use App\Validators\DateTimeValidator;
    use App\Validators\StringValidator;    
    
    class AuctionViewModel extends Model { 
        protected function getFields(): array {
            return [
                'auction_view_id' => new Field((new NumberValidator())->setIntegerLength(10), false),
                'created_at' => new Field((new DateTimeValidator())->allowDate()->allowTime() , false),

                'auction_id' => new Field((new NumberValidator())->setIntegerLength(10)),
                'ip_address' => new Field((new StringValidator(7, 255)) ),
                'user_agent' => new Field((new StringValidator(0, 255)) )


                /*'auction_id' => new Field('|^[1-9][0-9]{0,9}$|', true),
                'ip_address' => new Field('@^([0-9]{1,3}(\.[0-9]{1,3}){3})|(::[0-9]+)$@', true),
                'user_agent' => new Field('|^.{0,255}$|', true)*/

                /*'auction_view_id' => Field::readonlyInteger(20),
                'created_at' => Field::readonlyDateTime(),
                
                'auction_id' => Field::editableInteger(10),
                'ip_address' => Field::editableIpAddress(),
                'user_agent' => Field::editableString(255)*/

            ];
        }

        public function getAllByAuctionId(int $auctionId): array {
            return $this->getAllByFieldName('auction_id', $auctionId);            
        }

        public function getAllByIpAddress(string $ipAddress): array {
            return $this->getAllByFieldName('ip_address', $ipAddress);            
        }
    }