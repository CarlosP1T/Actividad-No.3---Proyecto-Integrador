from pyswip import Prolog
prolog = Prolog()
prolog.consult("hechos.pl")
#La consulta pudo ser unificada con base al Hecho 6 de la base de conocimiento.
g = prolog.query("progenitor(patricia,jaime)")
L=list(g)
print(L)
#Arroja la información de los bisnietos de tomas, con su respectivos padres y abuelos. 
#En este caso sólo tenemos una opción para X,Y,Z ya que sólo existe un bisnieto para 
#tomas que es jaime.
g = prolog.query("progenitor(tomas,X), progenitor(X,Y),progenitor(Y,Z)")
L=list(g)
print(L)

#Esta consulta arroja la informacion de los bisnietos de clara ,Si clara no fuera bisabuela
#de jaime, la consulta arrojaría false, pero en este caso prolog unifica la consulta y nos muestra el resultado.
#la unificacion que realiza prolog lo toma como esta consulta ?-progenitor(tomas,jose), ?-progenitor(jose,patricia).
#y ?-progenitor(patricia,jaime). y nos muestra los resultados.
g = prolog.query("progenitor(clara,X), progenitor(X,Y),progenitor(Y,jaime)")
L=list(g)
print(L)

#Esta consulta arroja todos los progenitores de jaime. Según el árbol genealógico de la 
#figura y los hechos definidos para el árbol, la única progenitora de jaime es patricia.
g = prolog.query("progenitor(X,jaime)")
L=list(g)
print(L)


