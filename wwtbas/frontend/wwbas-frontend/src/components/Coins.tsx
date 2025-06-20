
import { getFullnodeUrl, SuiClient } from '@mysten/sui/client';
import {useEffect} from 'react';


const Coins =()=>
    
const rpcUrl = getFullnodeUrl('testnet');

const client = new SuiClient({ url: rpcUrl });

useEffect(()=>{
    async function feachCoinsFor(adress:string){
        await client.getCoins({
            owner:adress,  
        }).catch((e)=>{
            console.log(e);
        }).then((res)=>{
            console.log(res);
        });   
    }
    fetchCoinsFor
    ('0xe679bcf6e7573309046af139dd99a1556898d8c855d0c49dcedd7f8b0a8fba5b');
},[])
    return(
        <div>Coins</div>
    )
}