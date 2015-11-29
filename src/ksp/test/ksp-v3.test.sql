/*PGR-GNU*****************************************************************

Copyright (c) 2015 pgRouting developers
Mail: project@pgrouting.org

------

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

********************************************************************PGR-GNU*/
--------------------------------------------------------------------------------
--              PGR_ksp V3
--------------------------------------------------------------------------------




-- Examples to handle the one flag to choose signatures using :ref:`fig1-direct-Cost-Reverse`
------------------------------------------------------------------------------------------


   SELECT 1, * FROM pgr_ksp(
     'SELECT id, source, target, cost, reverse_cost FROM edge_table',
      2, 12, 2, 
      true   -- takes the (V2.0) signature (has_rcost = true and works on directed graph)
   );


   SELECT 2, * FROM pgr_ksp(
     'SELECT id, source, target, cost, reverse_cost FROM edge_table',
      2, 12, 2,
      directed:=true   -- takes the new signature
   );

   SELECT 3, * FROM pgr_ksp(
     'SELECT id, source, target, cost, reverse_cost FROM edge_table',
      2, 12, 2
   );



--Examples using :ref:`fig1-direct-Cost-Reverse`
-------------------------------------------------------------------------------


   SELECT 4, * FROM pgr_ksp(
     'SELECT id, source, target, cost, reverse_cost FROM edge_table',
      2, 12, 2
   );
  

   SELECT 5, * FROM pgr_ksp(
     'SELECT id, source, target, cost, reverse_cost FROM edge_table',
      2, 12, 2, heap_paths:=true
   );

   SELECT 6, * FROM pgr_ksp(
     'SELECT id, source, target, cost, reverse_cost FROM edge_table',
      2, 12, 2, true, true
   );

--Example for :ref:`fig2-undirect-Cost-Reverse` 
-------------------------------------------------------------------------------


  SELECT 7, seq, path_id, cost, agg_cost FROM pgr_ksp(
     'SELECT id, source, target, cost, reverse_cost FROM edge_table',
      2, 12, 2, directed:=false
   );

  SELECT 8, seq, path_id, cost, agg_cost FROM pgr_ksp(
     'SELECT id, source, target, cost, reverse_cost FROM edge_table',
      2, 12, 2, directed:=false, heap_paths:=true
   );

  SELECT 9, * FROM pgr_ksp(
     'SELECT id, source, target, cost, reverse_cost FROM edge_table',
      2, 12, 2, false, true
   ) where edge = -1;



-- Examples for :ref:`fig3-direct-Cost` 
-------------------------------------------------------------------------------


  SELECT 10, * FROM pgr_ksp(
     'SELECT id, source, target, cost FROM edge_table',
      2, 3, 2
   );


  SELECT 11,  agg_cost FROM pgr_ksp(
     'SELECT id, source, target, cost FROM edge_table',
      2, 12, 2
   ) where edge = -1 order by agg_cost;


  SELECT 12,  agg_cost FROM pgr_ksp(
     'SELECT id, source, target, cost FROM edge_table',
      2, 12, 2, heap_paths:=true
   ) where edge = -1 order by agg_cost;

  SELECT 13, agg_cost FROM pgr_ksp(
     'SELECT id, source, target, cost FROM edge_table',
      2, 12, 2, true, true
   ) where edge = -1 order by agg_cost;

--Examples for :ref:`fig4-undirect-Cost` 
-------------------------------------------------------------------------------


  SELECT 14, * FROM pgr_ksp(
     'SELECT id, source, target, cost FROM edge_table',
      2, 12, 2, directed:=false
   );
  
  SELECT 15, * FROM pgr_ksp(
     'SELECT id, source, target, cost FROM edge_table',
      2, 12, 2, directed:=false, heap_paths:=true
   );

  SELECT 16, * FROM pgr_ksp(
     'SELECT id, source, target, cost FROM edge_table',
      2, 12, 2, false, true
   );

