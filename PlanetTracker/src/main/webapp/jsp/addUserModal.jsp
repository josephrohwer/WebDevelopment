<div id="addUserModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add User</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="add-user-form">
                    <div class="form-group">
                        <div class="col-md-12">
                            <p>Username</p>
                            <input type="text" class="form-control" id="add-username" maxlength="20" placeholder="Username" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <p>Password</p>
                            <input type="password" class="form-control" id="add-password" maxlength="256" placeholder="Password" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <p>Authority</p>
                            <select class="form-control" id="add-authority" required>
                                <option value="ROLE_USER">User</option>
                                <option value="ROLE_ADMIN">Admin</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="add-user-button" class="btn btn-primary" data-dismiss="modal">Add User</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>