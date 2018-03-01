<form class="form-horizontal" role="form" id="edit-form">
    <div class="form-group">
        <div class="col-md-12">
            <label for="edit-image-url">Image URL</label>
            <input type="url" class="form-control" id="edit-image-url" maxlength="256" placeholder="Image URL" required/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12">
            <label for="edit-name">Name</label>
            <input type="text" class="form-control" id="edit-name" maxlength="50" placeholder="Name" required/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12">
            <label for="edit-avg-temp">Average Temp</label>
            <input type="number" class="form-control" id="edit-avg-temp" min="-459" max="10000" placeholder="Average Temp (F)" required/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12">
            <label for="edit-rad-level">Radiation Level</label>
            <input type="number" class="form-control" id="edit-rad-level" min="0" max="10000" placeholder="Radiation Level (Sv)" required/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12">
            <label for="edit-planet-type">Planet Type</label>
            <select class="form-control" id="edit-planet-type" required>
                <option value="" selected disabled hidden>- Select Planet Type -</option>
                <option value="Rocky Planet">Rocky Planet</option>
                <option value="Gas Planet">Gas Planet</option>
                <option value="Ice Planet">Ice Planet</option>
                <option value="Iron Planet">Iron Planet</option>
                <option value="Lava Planet">Lava Planet</option>
                <option value="Ocean Planet">Ocean Planet</option>
                <option value="Terrestrial Planet">Terrestrial Planet</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12">
            <label for="edit-life-type">Life Type</label>
            <select class="form-control" id="edit-life-type" required>
                <option value="" selected disabled hidden>- Select Life Type -</option>
                <option value="Devoid">Devoid</option>
                <option value="Microbial">Microbial</option>
                <option value="Primitive">Primitive</option>
                <option value="Advanced">Advanced</option>
                <option value="Intelligent">Intelligent</option>
                <option value="Hyper-Intelligent">Hyper-Intelligent</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12" align="right">
            <sec:authorize access="hasRole('ROLE_ADMIN')"> 
                <button type="button" id="edit-planet-button" class="btn btn-primary">Update Planet</button>
            </sec:authorize>
            <input type="hidden" id="edit-planet-id">
            <button type="button" class="btn btn-default" onclick="hideEditForm()">Cancel</button>
        </div>
    </div>
</form>