'''
 * 2022  Ivo Fernandes <pg27165@alunos.uminho.pt>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * utFoods is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 '''
import os
import time
import glob
import pyotherside

class CleanCache():

    def moduleState():
        return 'Python Module Imported'
    
    def cleanCache():
        qml_cache_folder = glob.glob("%s/utfoods.ivofernandes/qmlcache/*" % os.environ["XDG_CACHE_HOME"])
        for files in qml_cache_folder:
            os.remove(files)


clean_cache = CleanCache()