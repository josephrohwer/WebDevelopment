<div id="add-planet-modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Planet</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="add-planet-form">
                    <ul class="list-group" id="modal-error-messages"></ul>
                    <div class="form-group">
                        <div class="col-md-12">
                            <label for="add-image-url">Image URL</label>
                            <input type="url" class="form-control" id="add-image-url" maxlength="256" placeholder="Image URL" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <label for="add-name">Name</label>
                            <input type="text" class="form-control" id="add-name" maxlength="50" placeholder="Name" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <label for="add-avg-temp">Average Temp</label>
                            <input type="number" class="form-control" id="add-avg-temp" min="-459" max="10000" placeholder="Average Temp (F)" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <label for="add-rad-level">Radiation Level</label>
                            <input type="number" class="form-control" id="add-rad-level" min="0" max="10000" placeholder="Radiation Level (Sv)" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <label for="add-planet-type">Planet Type</label>
                            <select class="form-control" id="add-planet-type" required>
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
                            <label for="add-life-type">Life Type</label>
                            <select class="form-control" id="add-life-type" required>
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
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="add-planet-button" class="btn btn-primary" data-dismiss="modal">Add Planet</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>