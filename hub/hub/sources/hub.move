
module hub::hub{

  use sui::url;
  use sui::coin::{Self, TreasuryCap};


 // one time withness
 public struct HUB has drop {}

 // define an innit function 
 fun init(hub: HUB, ctx: &mut TxContext){
    let strawberry_icon = url::new_unsafe_from_bytes(b"https://unsplash.com/photos/a-red-strawberry-against-a-red-background-ipBx_F8U3J8");

    let decimals: u8 = 8;
   
let (treasury_cap, metadata) = coin::create_currency(
    hub,
    decimals,
    b"HUB",
    b"sui Hub Lagos",
    b"coin created at semicolon Hub 24-06-2025",
    option::some(strawberry_icon),
    ctx,
);//   use  sui::coin::{Self, TreasuryCap} 

    transfer::public_freeze_object(metadata);
    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));

     
 
 }



public entry fun mint(treasury_cap: &mut TreasuryCap<HUB>, 
        amount: u64,
        recipient: address,
        ctx: &mut TxContext, 
        ){

        let coin = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coin, recipient);
    }

 }