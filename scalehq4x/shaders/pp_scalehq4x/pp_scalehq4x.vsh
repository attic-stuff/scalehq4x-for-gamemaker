/*
	== original license ==
	Copyright (C) 2005 guest(r) - guest.r@gmail.com

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	as published by the Free Software Foundation; either version 2
	of the License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
*/

/*
	== additional terms ==
	this gamermakerer implementation of guest.r's scalehq4x shader comes as is.
	its a post processing thing
	the shader code is not really readable sorry lol
	no support or warranty or anything
	suckers
*/

attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 vv_tex;
varying vec4 vv_col;

void main() {
	vec4 position = vec4(in_Position.xyz, 1.0);
	gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * position;
	vv_col = in_Colour;
	vv_tex = in_TextureCoord;	
}