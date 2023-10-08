<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
        <html>

        <head>
            <title>STOCK</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        </head>	 

        <body>

            <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: blue">
                    <div>
                        <a href="#" class="navbar-brand"> STOCK  </a>
                    </div>

                    <ul class="navbar-nav">
                        <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Etudiants</a></li>
                    </ul>
                </nav>
            </header>
            <br>

            <div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">Liste des PRODUITS</h3>
                    
                    <hr>
                    <div class="container text-left">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
  AJOUTER NOUVEAU PRODUIT
</button>
	
      
                    </div>
                    <br>
                    <table class="table table-bordered">
                    
                        <thead>
                            <tr>
                                <th>Identifiant</th>
                                <th>Nom</th>
                                <th>Caracteristique</th>
                                <th>Prix</th>
                                <th>Quantite en Stock</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!--   for (Todo todo: todos) {  -->
                            <c:forEach var="pro" items="${listProduit}">

                                <tr>
                                    <td>
                                        <c:out value="${pro.id}" />
                                    </td>
                                    <td>
                                        <c:out value="${pro.nom}" />
                                    </td>
                                    <td>
                                        <c:out value="${pro.caracteristique}" />
                                    </td>
                                    <td>
                                        <c:out value="${pro.prix}" />
                                    </td>
                                    <td>
                                        <c:out value="${pro.quantite}" />
                                    </td>
                                    <td  >  <button  class="btn btn-primary" data-toggle="modal" data-target="#modif" type="submit" <c:out value='${pro.id}' />" > Modifier</button> 
                                    &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete?id=<c:out value='${pro.id}' />">Suprimer</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp; <a href="detail?id=<c:out value='${pro.id}' />">DETAIL</a></td>
                                    
                                </tr>
                            </c:forEach>
                            <!-- } -->
                        </tbody>

                    </table>
                </div>
            </div>
            
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
                        <c:if test="${user != null}">
                            <form action="update" method="post">
                        </c:if>
                        <c:if test="${produit == null}">
                            <form action="insert" method="post">
                        </c:if>

                        <caption>
                            <h2>
                                <c:if test="${user != null}">
                                    Edit User
                                </c:if>
                                <c:if test="${user == null}">
                                    Ajout Etudiant
                                </c:if>
                            </h2>
                        </caption>

                        <c:if test="${user != null}">
                            <input type="hidden" name="id"  />
                        </c:if>

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
      
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
        
      </div>
    </div>
  </div>
</div>

<!-- modal modif -->
<div class="modal fade" id="modif" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
                        
                            <form action="update" method="post">
                       
                            <input  name="id" value="<c:out value="${produit.id}"/>" />
                        

                        <fieldset class="form-group">
                            <label>Nom</label> <input type="text"  class="form-control" name="nom" value="<c:out value="${produit.nom}"/>" required="required">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Caracteristique</label> <input type="text"  class="form-control" name="caracteristique" value="<c:out value='${produit.caracteristique}'/>">
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Prix</label> <input type="number"  class="form-control" name="prix" value="<c:out value='${produit.prix}'/>">
                        </fieldset>
                        
                        <fieldset class="form-group">
                            <label>Quantite</label> <input type="number"  class="form-control" name="quantite" value="<c:out value='${produit.quantite}'/>">
                        </fieldset>

                        <button type="submit" class="btn btn-success">Enregistrer la Modification</button>
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        </body>

        </html>