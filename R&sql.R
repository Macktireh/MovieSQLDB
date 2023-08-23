# chargement de packages
library(RODBC)

# connection à la DB buckboster
buckboster <- odbcConnect("buck", uid = "new", pwd = "1234");

# selectionne des table actor
tab.actor.buck <- sqlQuery(buckboster,"select * from Actor")
print(names(tab.actor.buck))
doublonstest<-which(duplicated(tab.actor.buck))

# selectionne des table actsin
tab.actsin.buck <- sqlQuery(buckboster,"select * from Actsin")
print(tab.actsin.buck)

# selectionne des table customer
tab.customer.buck <- sqlQuery(buckboster,"select * from Customer")
print(tab.customer.buck)
names(tab.customer.buck)

# selectionne des table movie
tab.movie.buck <- sqlQuery(buckboster,"select * from movie")
print(tab.movie.buck)

# selectionne des table gadget
tab.gadget.buck <- sqlQuery(buckboster,"select * from gadget")
print(tab.gadget.buck)

# selectionne des table sale_item
tab.saleitem.buck <- sqlQuery(buckboster,"select * from sale_item")
print(tab.saleitem.buck)

#-------------------------------------------------------------------------------#

# connection à la DB metrostarlet
metrostarlet <- odbcConnect("metro", uid = "c_metro", pwd = "12345");

# selectionne des table actor_metro
tab.actor.metro <- sqlQuery(metrostarlet,"select * from actor_metro")
print(tab.actor.metro)
dim(tab.actor.metro)
names(tab.actor.metro) 
tab.actor.buck=tab.actor.buck[,-3]
tab.actor.buck = tab.actor.buck[,c(2,1)]
names(tab.actor.buck) = names(tab.actor.metro)
z=rbind(tab.actor.buck,tab.actor.metro)
which(duplicated(z))
tab.actor.buck$actor_id_metro[tab.actor.buck$actor_id_metro=="63310"]

# selectionne des table actsin_metro
tab.actsin.metro <- sqlQuery(metrostarlet,"select * from astsin_metro")
print(tab.actsin.metro)


# selectionne des table customer_metro
tab.customer.metro <- sqlQuery(metrostarlet,"select * from customer_metro")
print(tab.customer.metro)
names(tab.customer.metro)

# selectionne des table movie_metro
tab.movie.metro <- sqlQuery(metrostarlet,"select * from movie_metro")
print(tab.movie.metro)

# selectionne des table copy_for_rent_metro
tab.rent.metro <- sqlQuery(metrostarlet,"select * from copy_for_rent_metro")
print(tab.rent.metro)

# selectionne des table copy_for_sale_metro
tab.sale.metro <- sqlQuery(metrostarlet,"select * from copy_for_sale_metro")
print(tab.sale.metro)

# selectionne des table copy_rented_to_metro
tab.rented.metro <- sqlQuery(metrostarlet,"select * from copy_rented_to_metro")
print(tab.rented.metro)


#-------------------------------------------------------------------------------#

# connection à la DB moviemegamart
moviemegamart <- odbcConnect("mydsn", uid = "c_mega", pwd = "12345");

# selectionne des table gadgetsales_mega
tab.gadgetsale.mega <- sqlQuery(moviemegamart,"select * from gadgetsales_mega")
print(tab.gadgetsale.mega)

# selectionne des table moviecopy_mega
tab.moviecopy.mega <- sqlQuery(moviemegamart,"select * from moviecopy_mega")
print(tab.moviecopy.mega)

# selectionne des table movierentals_mega
tab.movierentals.mega <- sqlQuery(moviemegamart,"select * from movierentals_mega")
print(tab.movierentals.mega)

# selectionne des table moviesales_mega
tab.moviesales.mega <- sqlQuery(moviemegamart,"select * from moviesales_mega1")
print(tab.moviesales.mega)