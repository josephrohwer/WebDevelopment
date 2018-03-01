<form class="form-horizontal" role="form" id="search-form">
    <div class="form-group">
        <div class="col-md-12">
            <label for="search-name">Name</label>
            <input type="text" class="form-control" id="search-name" maxlength="50" placeholder="Name"/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12">
            <label for="search-avg-temp">Average Temp</label>
            <input type="number" class="form-control" id="search-avg-temp" min="-459" max="10000" placeholder="Average Temp (F)"/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12">
            <label for="search-rad-level">Radiation Level</label>
            <input type="number" class="form-control" id="search-rad-level" min="0" max="10000" placeholder="Radiation Level (Sv)"/>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12">
            <label for="search-planet-type">Planet Type</label>
            <select class="form-control" id="search-planet-type">
                <option value="" selected disabled hidden>- Select Planet Type -</option>
                <option value="Rocky Planet">Rocky Planet</option>
                <option value="Gas Planet">Gas Planet</option>
                <option value="Ice Planet">Ice Planet</option>
                <option value="Iron Planet">Iron Planet</option>
                <option value="Lava Planet">Lava Planet</option>
                <option value="Ocean Planet">Ocean Planet</option>
                <option value="Terrestrial Planet">Terrestrial Planet</option>
                <option value="">All</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12">
            <label for="search-life-type">Life Type</label>
            <select class="form-control" id="search-life-type">
                <option value="" selected disabled hidden>- Select Life Type -</option>
                <option value="Devoid">Devoid</option>
                <option value="Microbial">Microbial</option>
                <option value="Primitive">Primitive</option>
                <option value="Advanced">Advanced</option>
                <option value="Intelligent">Intelligent</option>
                <option value="Hyper-Intelligent">Hyper-Intelligent</option>
                <option value="">All</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-12" align="right">
            <input type="button" class="btn btn-primary" id="search-button" value="Search"/>
        </div>
    </div>
</form>