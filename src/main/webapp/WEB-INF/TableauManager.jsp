<%@ page import="java.util.List" %>
<%@ page import="com.G5GestionProduit.application.Produit" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


    }
<html>
<head>
    <!-- Importe Bootstrap pour la modal -->

     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- ... -->
</head>
<body>
<div class="container">

<h1 class="header bg-primary text-center ">Liste des Produits </h1>



	<table id="example" class="table table-bordered table-hover">
	    <button type="button" class="btn btn-primary my-3" data-toggle="modal" data-target="#staticBackdrop">
  			<i class="fa fa-plus" style="color:white"> </i>	NOUVEAU PRODUIT
		</button> 
		<a class=" btn color-white bg-primary" style="float: right; color:white;"href="/G5-GestionProduit/users">SE Deconnecter</a>
		<thead class="thead-dark">
			<tr>
				<th class="text-center" scope="col">IDENTIFIANT</th>
				<th class="text-center" scope="col">NOM</th>
				<th class="text-center" scope="col">CARACTERISTIQUE</th>
				<th class="text-center" scope="col">PRIX</th>
				<th class="text-center" scope="col">QUANTITE</th>
				<th class="text-center"  colspan="4">ACTION</th>
			</tr>
		</thead>
	
		<tbody>
		<c:forEach var="p" items="${listProduit}">
			<tr>
				<td class="text-center"><c:out value="${p.id}"></c:out></td>
				<td class="text-center"><c:out value="${p.nom}"></c:out></td>
				<td class="text-center"> <c:out value="${p.caracteristique}"></c:out></td>
				<td class="text-center"><c:out value="${p.prix}"></c:out></td>
				<td class="text-center"><c:out value="${p.quantite}"></c:out></td>
				<td class="text-center">
				
	     			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<c:out value="${p.id}"></c:out>">
	      			 <i class="fa fa-edit" style="color:#14BDC5 "> </i> 
	    			</button>
	     			 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#detail<c:out value="${p.id}"></c:out>">
	      			 <i class="fa fa-info-circle" style="color:#14BDC5 "> </i> 
	    			</button>
	    		</td>
		</tr>
			
			<!-- Modal  modification-->
    <div class="modal fade" id="myModal<c:out value="${p.id}"></c:out>" role="dialog">
      <div class="modal-dialog">
        <!-- Contenu de la modal -->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close bg-primary m-2" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Modifier le Produit <c:out value="${p.id}"></c:out></h4>
          </div>
          <div class="modal-body">
            <!-- Affiche les détails de la personne dans la modal -->
            <form action="update" method="post">
            	<div class="form-group">
            		<input type="number"  name="id" value="<c:out value="${p.id}"></c:out>">
            	</div>
            	<div class="form-group">
            		<label>NOM</label>
            		<input class="form-control" type="text" name="nom" value="<c:out value="${p.nom}"></c:out>">
            	</div>
            	<div class="form-group">
            		<label>CARACTERISTIQUE</label>
            		<input class="form-control" type="text" name="caracteristique" value="<c:out value="${p.caracteristique}"></c:out>">
            	</div>
            	<div class="form-group">
            		<label>PRIX</label>
            		<input class="form-control" type="number" name="prix" value="<c:out value="${p.prix}"></c:out>">
            	</div>
            	<div class="form-group">
            		<label>QUANTITE</label>
            		<input class="form-control" type="number" name="quantite" value="<c:out value="${p.quantite}"></c:out>">
            	</div>
            	<div class="form-group">
            		<button type="submit" class="btn btn-primary">MODIFIER</button>
            	</div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
          </div>
        </div>
      </div>
    </div>
    </div>
    
    <!-- Modal  Detail-->
    <div class="modal fade" id="detail<c:out value="${p.id}"></c:out>" role="dialog">
      <div class="modal-dialog">
        <!-- Contenu de la modal -->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Détails de <c:out value="${p.nom}"></c:out></h4>
          </div>
          <div class="modal-body">
            <!-- Affiche les détails de la personne dans la modal -->
            <p>ID : <c:out value="${p.id}"></c:out></p>
            <p>Nom : <c:out value="${p.nom}"></c:out></p>
            <p>Caracteristique : <c:out value="${p.caracteristique}"></c:out></p>
             <p>Prix : <c:out value="${p.prix}"></c:out></p>
            <p>Quantite: <c:out value="${p.quantite}"></c:out></p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
          </div>
        </div>
      </div>
    </div>
    </div>
			</c:forEach>
		</tbody>
		
		
		
	</table>
   
                <!-- Modal AJOUT -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title bg-primary" id="staticBackdropLabel ">Ajout Produit</h5>
        <button type="button" class="close bg-danger" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container ">
                <div class="card">
                    <div class="card-body">
                         <form action="insert" method="post">
                        <caption>
                            <h2>
                              Ajout Produit
                            </h2>
                        </caption>
                        <fieldset class="form-group">
                            <label>Nom</label> <input type="text"  class="form-control" name="nom" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Caracteristique</label> <input type="text"  class="form-control" name="caracteristique">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Prix</label> <input type="number"  class="form-control" name="prix">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Quantite</label> <input type="number"  class="form-control" name="quantite">
                        </fieldset>

                        <button type="submit" class="btn btn-success">Enregistrer</button>
                        </form>
                    </div>
                </div>
            </div>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
        
      </div>
    </div>
  </div>
  
</div>
    

    

<!-- Importe Bootstrap et jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
        function confirmerSuppression(id) {
            if (confirm("Êtes-vous sûr de vouloir supprimer ce produit ?")) {
                // Si l'utilisateur confirme, soumet le formulaire de suppression
                document.querySelector('form[action="delete"] input[name="id"]').value = id;
                document.querySelector('form[action="delete"]').submit();
            }
        }
        
    </script>
    

<!-- ... -->

</body>
</html>
