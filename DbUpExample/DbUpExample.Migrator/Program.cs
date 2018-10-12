using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using CommandLine;
using DbUp;

namespace DbUpExample.Migrator
{
    class Program
    {
        static void Main(string[] args)
        {
            var result = Parser.Default.ParseArguments<Options>(args);

            result
                .WithParsed(r => Migrate(r));
        }

        private static void Migrate(Options options)
        {
            var migrator =
                DeployChanges.To
                    .SqlDatabase(options.ConnectionString)
                    .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly(), s => Filter(s))
                    .LogToAutodetectedLog()
                    .Build();

            var result = migrator.PerformUpgrade();

            if (result.Successful)
            {
                Console.WriteLine("Success!");
            }
            else
            {
                Console.WriteLine(result.Error);
            }
        }

        private static bool Filter(string script)
        {
            return script.StartsWith("DbUpExample.Migrator.Migrations");
        }
    }
}
