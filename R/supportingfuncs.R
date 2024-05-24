flambda1 = function(phi1, phi, nj = 30, pi1j=1/3, pi0j=1/3){
  num = log((1-phi1)/(1-phi))+log(pi1j/pi0j)/nj
  den = log((phi*(1-phi1))/(phi1*(1-phi)))
  lambda1j = num/den
  return(lambda1j)
}

flambda2 = function(phi2, phi, nj = 30, pi2j=1/3, pi0j=1/3){
  num = log((1-phi)/(1-phi2))+log(pi0j/pi2j)/nj
  den = log((phi2*(1-phi))/(phi*(1-phi2)))
  lambda2j = num/den
  return(lambda2j)
}

optim_phi1 = function(phi1,phi,lambda1){
  return((flambda1(phi1,phi)-lambda1)^2)
}

optim_phi2 = function(phi2,phi,lambda2){
  return((flambda2(phi2,phi)-lambda2)^2)
}
