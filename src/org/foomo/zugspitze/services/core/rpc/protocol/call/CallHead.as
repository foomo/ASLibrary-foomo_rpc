/*
 * This file is part of the foomo Opensource Framework.
 *
 * The foomo Opensource Framework is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License as
 * published  by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * The foomo Opensource Framework is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along with
 * the foomo Opensource Framework. If not, see <http://www.gnu.org/licenses/>.
 */
package org.foomo.zugspitze.services.core.rpc.protocol.call
{
	import org.foomo.zugspitze.services.core.rpc.protocol.AbstractHead;

	[ExcludeClass]
	[RemoteClass(alias='Foomo.Services.RPC.Protocol.Call.Head')]

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 * @author  jan <jan@bestbytes.de>
	 * @private
	 */
	public class CallHead extends AbstractHead
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * name of the user
		 */
		public var username:String;
		/**
		 * password of the user
		 */
		public var password:String;
		/**
		 * name of the class to be called
		 */
		public var className:String;
		/**
		 * version of the class
		 */
		public var classVersion:Number;
	}
}