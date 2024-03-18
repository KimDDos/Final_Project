	console.log(coupons);
        const modal = document.querySelector('.modal');
        const btnOpenModal=document.querySelector('.btn-open-modal');
        const btnCloseModal=document.querySelector('.btn-close-modal');
        var btnCoupon;
        btnOpenModal.addEventListener("click", ()=>{
        	if(modal.style.display == "flex")
        		{
        		modal.style.display="none";
        		}
        	else modal.style.display="flex";
        });
        btnCloseModal.addEventListener("click", ()=>{
        	if(modal.style.display == "flex")
        		{
        		modal.style.display="none";
        		}
        	else modal.style.display="flex";
        });
        for(let i=0;i<coupons.length;i++)
		{
			btnCoupon = document.getElementById('coupon'+coupons[i]);
			console.log(coupons[i]);
			btnCoupon.addEventListener("click", ()=>{
        	if(modal.style.display == "flex")
        		{
        		modal.style.display="none";
        		}
        	else modal.style.display="flex";
        	console.log("CLICK");
        	document.getElementById('useCpNum').value = coupons[i];
        });
	}