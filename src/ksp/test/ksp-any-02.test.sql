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
--
-- Generate 15 shortest paths between nodes 4 and 5
-- with auto detection
-- V3
--

select seq, path_id, node, edge, round(cost::numeric, 4) from pgr_ksp(
    'select id, source, target, cost from network order by id',
    4, 5::bigint,
    15);

select path_id, round(sum(cost)::numeric,4) from pgr_ksp(
    'select id, source, target, cost from network order by id',
    4, 5::bigint,
    15) group by path_id order by path_id;


-- the equality conditions
select seq, path_id, node = network.source,  edge = network.id, round(network.cost::numeric,4) = round(result.cost::numeric, 4) from pgr_ksp(
    'select id, source, target, cost from network order by id',
    4, 5::bigint,
    15) result, network where id = edge order by seq;
