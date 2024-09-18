//const prm1=new Promise(resolve, reject);
//prm1.then(function(res){
//    console.log(res)
//})
//prm1.catch(function(err){
  //  console.log(err)
//})

var result = fetch("https://randomuser.me/api/")
result.then(function(res){
    console.log(res)
    var data = res.json();
    data.then((userData)=>{
        console.log(userData)
    })
})
result.catch((err) => {
    console.log(err)
})



//the 10 lines  code into 5 lines

window.onload = async function () {
    var result = await fetch("https://randomuser.me/api")
    var data = await result.json()
    console.log(data)
    
}