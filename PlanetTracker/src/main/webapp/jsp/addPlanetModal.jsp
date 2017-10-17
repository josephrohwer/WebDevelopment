<div id="addPlanetModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Planet</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="add-form">
                    <div class="form-group">
                        <label for="add-name" class="col-md-4 control-label">Name:</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" id="add-name" maxlength="50" placeholder="Name" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-avg-temp" class="col-md-4 control-label">Average Temp:</label>
                        <div class="col-md-8">
                            <input type="number" class="form-control" id="add-avg-temp" min="-459" max="10000" placeholder="Average Temp (F)" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-rad-level" class="col-md-4 control-label">Radiation Level:</label>
                        <div class="col-md-8">
                            <input type="number" class="form-control" id="add-rad-level" min="0" max="10000" placeholder="Radiation Level (Sv)" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add-planet-type" class="col-md-4 control-label">Planet Type:</label>
                        <div class="col-md-8">
                            <select class="form-control" id="add-planet-type" required>
                                <option value="" selected disabled hidden>Select Planet Type</option>
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
                        <label for="add-life-type" class="col-md-4 control-label">Life Type:</label>
                        <div class="col-md-8">
                            <select class="form-control" id="add-life-type" required>
                                <option value="" selected disabled hidden>Select Life Type</option>
                                <option value="Rocky Planet">Devoid</option>
                                <option value="Gas Planet">Microbial</option>
                                <option value="Ice Planet">Primitive</option>
                                <option value="Iron Planet">Advanced</option>
                                <option value="Lava Planet">Intelligent</option>
                                <option value="Ocean Planet">Hyper-Intelligent</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="add-button" class="btn btn-default" data-dismiss="modal">Add Planet</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>

    </div>
</div>