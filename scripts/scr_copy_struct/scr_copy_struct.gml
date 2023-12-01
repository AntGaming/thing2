// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function copy_struct(SS)
{
	var AR = variable_struct_get_names(SS);
    
    var SS_new = {};
    for (var i = 0; i < array_length(AR); i++;)
    {
        SS_new[$ AR[i]] = SS[$ AR[i]];
    }
    
    return(SS_new);
}