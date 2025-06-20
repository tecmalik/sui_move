import { useEffect } from "react";
import { getFaucetHost, requestSuiFromFaucetV2 } from '@mysten/sui/faucet';

const Faucet = () => {
    useEffect(() => {
        async function fetchFaucet(){
	
        await requestSuiFromFaucetV2({
	    host: getFaucetHost('testnet'),
	    recipient: '0xe679bcf6e7573309046af139dd99a1556898d8c855d0c49dcedd7f8b0a8fba5b'
    }).catch((e)=>{
        console.log(e);
    }).then((res)=>{
        console.log(res);
    });
    headers:{''}
    } 
    fetchFaucet();
    },[])
    return(
        <div>Faucet</div>
    )
}
export default Faucet;