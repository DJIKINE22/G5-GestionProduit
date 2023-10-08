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

<h1 class="header bg-dark">Liste des Produits</h1>


	<table class="table table">
	    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
  			<i class="fa fa-plus" style="color:white"> </i>	NOUVEAU PRODUIT
		</button> 
		<thead>
			<tr>
				<th>IDENTIFIANT</th>
				<th>NOM</th>
				<th>CARACTERISTIQUE</th>
				<th>PRIX</th>
				<th>QUANTITE</th>
				<th col-span="3">ACTION</th>
			</tr>
		</thead>
		<%
    List<Produit> listProduit = (List<Produit>) request.getAttribute("listProduit");
		

    for (Produit p : listProduit) {
%>
		<tbody>
			<tr>
			<td><%= p.getId() %></td>
			<td><%= p.getNom() %></td>
			<td> <%= p.getCaracteristique() %></td>
			<td><%= p.getPrix() %></td>
			<td><%= p.getQuantite() %></td>
			<td><button type="button" class="btn btn-primary" >
				<a href="delete?id=<%= p.getId() %>"> </a>
     			 <i class="fa fa-trash " aria-hidden="true" style="color:red"></i>
     			 </button>
     			 <a href="delete?id=<%= p.getId() %>">Suprimer</a>
     			 	 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal<%= p.getId() %>">
      			 <i class="fa fa-edit" style="color:#14BDC5 "> </i> 
    			</button>
     			 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#detail<%= p.getId() %>">
      			 <i class="fa fa-info-circle" style="color:#14BDC5 "> </i> 
    			</button>
    			
    		</td>
			</tr>
			
			<!-- Modal  modification-->
    <div class="modal fade" id="myModal<%= p.getId() %>" role="dialog">
      <div class="modal-dialog">
        <!-- Contenu de la modal -->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Détails de <%= p.getNom() %></h4>
          </div>
          <div class="modal-body">
            <!-- Affiche les détails de la personne dans la modal -->
            <form action="update" method="post">
            	<div class="form-group">
            		<input type="number"  name="id" value="<%= p.getId() %>">
            	</div>
            	<div class="form-group">
            		<label>NOM</label>
            		<input class="form-control" type="text" name="nom" value="<%= p.getNom() %>">
            	</div>
            	<div class="form-group">
            		<label>CARACTERISTIQUE</label>
            		<input class="form-control" type="text" name="caracteristique" value="<%= p.getCaracteristique() %>">
            	</div>
            	<div class="form-group">
            		<label>PRIX</label>
            		<input class="form-control" type="number" name="prix" value="<%= p.getPrix() %>">
            	</div>
            	<div class="form-group">
            		<label>QUANTITE</label>
            		<input class="form-control" type="number" name="quantite" value="<%= p.getQuantite() %>">
            	</div>
            	<div class="form-group">
            		<button type="submit" class="btn btn-primary">MODIFIER</button>
            	</div>
            </form>
          </div>
          <!-- <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
          </div> -->
        </div>
      </div>
    </div>
    </div>
    
    <!-- Modal  Detail-->
    <div class="modal fade" id="detail<%= p.getId() %>" role="dialog">
      <div class="modal-dialog">
        <!-- Contenu de la modal -->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Détails de <%= p.getNom() %></h4>
          </div>
          <div class="modal-body">
            <!-- Affiche les détails de la personne dans la modal -->
            <p>ID : <%= p.getId() %></p>
            <p>Nom : <%= p.getNom() %></p>
            <p>Caracteristique : <%= p.getCaracteristique() %></p>
             <p>Prix : <%= p.getPrix() %></p>
            <p>Quantite: <%= p.getQuantite() %></p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Fermer</button>
          </div>
        </div>
      </div>
    </div>
    </div>
			<%
                }
            %>
		</tbody>
		
	</table>
    <!-- Affiche les informations dans la page -->
    
    
    <!-- Ajoute un bouton ou un lien pour ouvrir la modal avec les informations -->
   
    
                <!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Ajout Produit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                                
                                    Ajout Etudiant
                                
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

<!-- ... -->

</body>
</html>
