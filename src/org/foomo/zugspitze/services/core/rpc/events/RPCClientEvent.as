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
package org.foomo.zugspitze.services.core.rpc.events
{
	import flash.events.Event;

	import org.foomo.zugspitze.services.core.rpc.RPCTransport;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 * @author  jan <jan@bestbytes.de>
	 */
	public class RPCClientEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const RPC_TRANSPORT_COMPLETE:String 	= "rpcTransportComplete";
		public static const RPC_TRANSPORT_PROGRESS:String 	= "rpcTransportProgress";
		public static const RPC_TRANSPORT_OPEN:String 		= "rpcTransportOpen";

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _transport:RPCTransport;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCClientEvent(type:String, transport:RPCTransport)
		{
			this._transport = transport;

			super(type);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get transport():RPCTransport
		{
			return _transport;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new RPCClientEvent(this.type, this.transport);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString("RPCClientEvent", "transport");
		}
	}
}