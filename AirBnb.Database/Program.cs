using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DbUp.Engine;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace AirBnb.Database
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString =
                args.FirstOrDefault() ??
                "Server=localhost,1433\\Catalog=AirBnb;Database=AirBnb;User=SA;Password=W6g48qonqxa;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;";
            DatabaseUpgradeResult result = Deployer.DeployDatabase(connectionString);
            if (!result.Successful)
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();

                Console.ReadLine();
            }

            Console.ForegroundColor = ConsoleColor.Green;
            Console.WriteLine("Success!");
            Console.ResetColor();
        }
    }
}
