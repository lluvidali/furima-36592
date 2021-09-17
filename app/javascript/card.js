const pay = () => {
  Payjp.setPublicKey(""); 
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_info[number]"),
      cvc: formData.get("order_info[cvc]"),
      exp_month: formData.get("order_info[exp_month]"),
      exp_year: `20${formData.get("order_info[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("order_info_number").removeAttribute("name");
      document.getElementById("order_info_cvc").removeAttribute("name");
      document.getElementById("order_info_exp_month").removeAttribute("name");
      document.getElementById("order_info_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);

