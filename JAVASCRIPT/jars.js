let l = [0,0,0];
let round1 = 10;
let round2 = 20;
let round3 = 30;

for(let i=0;i<round1;i++){
    l[i%3]+=1;
}
for(let i=0;i<round2;i++){ 
    l[i%3]+=1;
}
for(let i=0;i<round3;i++){
    l[i%3]+=1;
}
console.log(l);