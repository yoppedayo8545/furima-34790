const pay = () => {
  Payjp.setPublicKey("pk_test_68fad77d3eb4cc474f9e72c9");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
        number: formData.get("purchase_address[number]"),
        cvc: formData.get("purchase_address[cvc]"),
        exp_month: formData.get("purchase_address[exp_month]"),
        exp_year: `20${formData.get("purchase_address[exp_year]")}`,
      };

      Payjp.createToken(card, (status, response) => {
        if (status == 200) {
          const token = response.id;
          console.log(token)
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden"> `;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }
        document.getElementById("card_number").removeAttribute("name");
        document.getElementById("card_cvc").removeAttribute("name");
        document.getElementById("card_exp_month").removeAttribute("name");
        document.getElementById("card_exp_year").removeAttribute("name");
        
        document.getElementById("charge-form").submit();
      });
    });
  };



window.addEventListener('load', pay);

// const priceInput = document.getElementById("item-price");
//   priceInput.addEventListener("input", () => {
//     const inputValue = priceInput.value;
//     const addTaxPrice = document.getElementById("add-tax-price");
//     addTaxPrice.innerHTML = Math.floor(inputValue*0.1)
//     const addProfit = document.getElementById("profit");
//     addProfit.innerHTML = Math.floor(inputValue*0.9)
//   })
// }